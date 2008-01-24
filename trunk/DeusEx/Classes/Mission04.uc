//=============================================================================
// Mission04.
//=============================================================================
class Mission04 expands MissionScript;

// ----------------------------------------------------------------------
// FirstFrame()
// 
// Stuff to check at first frame
// ----------------------------------------------------------------------

function FirstFrame()
{
	local ScriptedPawn pawn;
	local PaulDenton paul;
	local FlagTrigger ftrig;
	local int count;
	local Inventory item;
	local float txPos;
	local vector loc;
	local Class<Actor> spawnclass;
	local name tname;

	Super.FirstFrame();

	if(flags.GetBool('PlayerBailedOutWindow'))
	{
		if(flags.GetBool('M04_Hotel_Cleared'))
			flags.SetBool('PlayerBailedOutWindow', False,, 0);
		else
			flags.SetBool('PaulDenton_Dead', True,, 0);
	}

	if (localURL == "04_NYC_STREET")
	{
		// unhide a bunch of stuff on this flag
		if (flags.GetBool('TalkedToPaulAfterMessage_Played'))
		{
			foreach AllActors(class'ScriptedPawn', pawn)
				if (pawn.IsA('UNATCOTroop') || pawn.IsA('SecurityBot2'))
					pawn.EnterWorld();
		}
	}
	else if (localURL == "04_NYC_FREECLINIC")
	{
		// unhide a bunch of stuff on this flag
		if (flags.GetBool('TalkedToPaulAfterMessage_Played'))
		{
			foreach AllActors(class'ScriptedPawn', pawn)
				if (pawn.IsA('UNATCOTroop'))
					pawn.EnterWorld();
		}
	}
	else if (localURL == "04_NYC_HOTEL")
	{
		// unhide the correct JoJo
		if (flags.GetBool('SandraRenton_Dead') ||
			flags.GetBool('GilbertRenton_Dead'))
		{
			if (!flags.GetBool('JoJoFine_Dead'))
				foreach AllActors(class'ScriptedPawn', pawn, 'JoJoInLobby')
					pawn.EnterWorld();
		}

		if(!flags.GetBool('M04RaidTeleportDone'))
		{
			// Lesson the first: Paul should never leave until AFTER the raid
			foreach AllActors(Class'PaulDenton', paul)
				paul.EnterWorld();
		}
		//== Let's get rid of the damn auto-kill flag so we can intelligently track whether or not Paul is dead.
		if(!flags.GetBool('M04_Paul_Check_Fixed'))
		{
			foreach AllActors(Class'FlagTrigger', ftrig)
			{
				if(ftrig.flagName == 'PaulDenton_Dead' && ftrig.flagValue)
				{
					ftrig.bSetFlag = False;
					flags.SetBool('M04_Paul_Check_Fixed', True,, 6);
				}
			}
		}

		//== Set the phone in the room because it was there last time
		if (!flags.GetBool('M04_Ans_Mach_Placed'))
		{
			if(Spawn(class'Phone',None,, vect(-613.23, -3236.47, 117.19)) != None)
				flags.SetBool('M04_Ans_Mach_Placed', True,, 5);
		}
	}
	else if (localURL == "04_NYC_NSFHQ")
	{
		if(!flags.GetBool('M04_Switch_Trig_Placed'))
		{
			ftrig = Spawn(class'FlagTrigger',None,, vect(-138.417221, 62.275002, 1208.103882));
			if(ftrig != None)
			{
				ftrig.Tag = 'UNATCOHatesPlayer';
				ftrig.bSetFlag = True;
				ftrig.bTrigger = False;
				ftrig.flagExpiration = 5;
				ftrig.FlagName = 'UNATCOSwitched';
				ftrig.flagValue = True;

				flags.SetBool('M04_Switch_Trig_Placed', True,, 5);
			}
		}
	}
	else if (localURL == "04_NYC_UNATCOHQ")
	{
		//== Spawn all the stuff JC "stores" in his office
		count = 0;
		txPos = -384.0000;
		do
		{
			tname = flags.GetName(DeusExRootWindow(Player.rootWindow).StringToName("M03_JC_Item_"$ count));

			if(tname != '')
			{
				spawnclass = class<Inventory>(DynamicLoadObject("DeusEx."$ tname, class'Class'));

				item = Inventory(spawn(spawnclass, None));

				if(item.invSlotsX * item.invSlotsY > 4)
				{
					loc.X = -360 + (16 - Rand(32));
					loc.Y = 1074 + (item.CollisionRadius);
					loc.Z = 324 + (16 - Rand(24));
				}
				else
				{
					if(txPos + item.CollisionRadius >= 310.000)
						txPos = -384.0000;
	
					txPos += item.CollisionRadius;
	
					loc.X = txPos;
					loc.Y = 1062;
					loc.Z = 324 + (16 - (frand() * 24));
				}

				item.SetLocation(loc);

				flags.DeleteFlag(DeusExRootWindow(Player.rootWindow).StringToName("M03_JC_Item_"$ count), FLAG_Name);

				//== Now we need to handle all the weapon mods, if applicable
				if(item.IsA('DeusExWeapon'))
				{
					tname = DeusExRootWindow(Player.rootWindow).StringToName("M03_JC_Item_"$ count $"_bHasLaser");
					if(DeusExWeapon(item).bCanHaveLaser)
						DeusExWeapon(item).bHasLaser = flags.GetBool(tname);
					flags.DeleteFlag(tname, FLAG_Bool);

					tname = DeusExRootWindow(Player.rootWindow).StringToName("M03_JC_Item_"$ count $"_bHasSilencer");
					if(DeusExWeapon(item).bCanHaveSilencer)
						DeusExWeapon(item).bHasSilencer = flags.GetBool(tname);
					flags.DeleteFlag(tname, FLAG_Bool);

					tname = DeusExRootWindow(Player.rootWindow).StringToName("M03_JC_Item_"$ count $"_bHasScope");
					if(DeusExWeapon(item).bCanHaveScope)
						DeusExWeapon(item).bHasScope = flags.GetBool(tname);
					flags.DeleteFlag(tname, FLAG_Bool);

					tname = DeusExRootWindow(Player.rootWindow).StringToName("M03_JC_Item_"$ count $"_ModBaseAccuracy");
					if(DeusExWeapon(item).bCanHaveModBaseAccuracy)
					{
						DeusExWeapon(item).ModBaseAccuracy = flags.GetFloat(tname);
						if(DeusExWeapon(item).Default.BaseAccuracy == 0.0)
							DeusExWeapon(item).BaseAccuracy = 0.0 - DeusExWeapon(item).ModBaseAccuracy;
						else
							DeusExWeapon(item).BaseAccuracy = DeusExWeapon(item).Default.BaseAccuracy - (DeusExWeapon(item).Default.BaseAccuracy * DeusExWeapon(item).ModBaseAccuracy);
					}
					flags.DeleteFlag(tname, FLAG_Float);

					tname = DeusExRootWindow(Player.rootWindow).StringToName("M03_JC_Item_"$ count $"_ModReloadCount");
					if(DeusExWeapon(item).bCanHaveModReloadCount)
					{
						DeusExWeapon(item).ModReloadCount = flags.GetFloat(tname);
						DeusExWeapon(item).ReloadCount = DeusExWeapon(item).Default.ReloadCount + Int(FMax(Float(DeusExWeapon(item).Default.ReloadCount) * DeusExWeapon(item).ModReloadCount, 1.0));
					}
					flags.DeleteFlag(tname, FLAG_Float);

					tname = DeusExRootWindow(Player.rootWindow).StringToName("M03_JC_Item_"$ count $"_ModAccurateRange");
					if(DeusExWeapon(item).bCanHaveModAccurateRange)
					{
						DeusExWeapon(item).ModAccurateRange = flags.GetFloat(tname);
						DeusExWeapon(item).AccurateRange = DeusExWeapon(item).Default.AccurateRange + (DeusExWeapon(item).Default.AccurateRange * DeusExWeapon(item).ModAccurateRange);
					}
					flags.DeleteFlag(tname, FLAG_Float);

					tname = DeusExRootWindow(Player.rootWindow).StringToName("M03_JC_Item_"$ count $"_ModReloadTime");
					if(DeusExWeapon(item).bCanHaveModReloadTime)
					{
						DeusExWeapon(item).ModReloadTime = flags.GetFloat(tname);
						DeusExWeapon(item).ReloadTime = FMax(DeusExWeapon(item).Default.ReloadTime + (DeusExWeapon(item).Default.ReloadTime * DeusExWeapon(item).ModReloadTime), 0.0);
					}
					flags.DeleteFlag(tname, FLAG_Float);

					tname = DeusExRootWindow(Player.rootWindow).StringToName("M03_JC_Item_"$ count $"_ModRecoilStrength");
					if(DeusExWeapon(item).bCanHaveModRecoilStrength)
					{
						DeusExWeapon(item).ModRecoilStrength = flags.GetFloat(tname);
						DeusExWeapon(item).RecoilStrength = FMax(DeusExWeapon(item).Default.RecoilStrength + (DeusExWeapon(item).Default.RecoilStrength * DeusExWeapon(item).ModRecoilStrength), 0.0);
					}
					flags.DeleteFlag(tname, FLAG_Float);

					tname = DeusExRootWindow(Player.rootWindow).StringToName("M03_JC_Item_"$ count $"_ModShotTime");
					if(DeusExWeapon(item).bCanHaveModShotTime)
					{
						DeusExWeapon(item).ModShotTime = flags.GetFloat(tname);
						DeusExWeapon(item).ShotTime = FMax(DeusExWeapon(item).Default.ShotTime + (DeusExWeapon(item).Default.ShotTime * DeusExWeapon(item).ModShotTime), 0.0);
					}
					flags.DeleteFlag(tname, FLAG_Float);
				}
				else if(item.IsA('AugmentationCannister'))
				{
					tname = DeusExRootWindow(Player.rootWindow).StringToName("M03_JC_Item_"$ count $"_Aug1");
					AugmentationCannister(item).AddAugs[0] = flags.GetName(tname);
					flags.DeleteFlag(tname, FLAG_Name);

					tname = DeusExRootWindow(Player.rootWindow).StringToName("M03_JC_Item_"$ count $"_Aug2");
					AugmentationCannister(item).AddAugs[1] = flags.GetName(tname);
					flags.DeleteFlag(tname, FLAG_Name);
				}

				count++;
			}
			else
				item = None;

		}until(item == None);

	}
}

// ----------------------------------------------------------------------
// PreTravel()
// 
// Set flags upon exit of a certain map
// ----------------------------------------------------------------------

function PreTravel()
{
	local int count;
	local MIB mblack;
	local UNATCOTroop troop;
	local PaulDenton paul;
	local Inventory item;
	local name tname;

	// If the hotel is clear of hostiles when the player leaves through the window,
	//  remove the "Player Bailed" flag so Paul doesn't wind up dead anyway
	if (localURL == "04_NYC_HOTEL" && flags.GetBool('M04RaidTeleportDone'))
	{
		count = 1;

		foreach AllActors(Class'PaulDenton', paul)
		{
			//== If Paul has left the building, or if he acts like he's safe, he's safe
			if(paul.bHidden || flags.GetBool('M04RaidDone'))
				count = 0;
		}

		if(count > 0)
		{
			count = 0;
			foreach AllActors(Class'UNATCOTroop', troop)
			{
				if(troop.bHidden == False)
					count++;
			}
	
			foreach AllActors(Class'MIB', mblack)
			{
				if(mblack.bHidden == False)
					count += 2;
			}
		}

		if(count <= 0)
		{
			flags.SetBool('M04_Hotel_Cleared', True,, 6);
			flags.SetBool('PlayerBailedOutWindow', False,, 0);
			flags.SetBool('PaulDenton_Dead', False,, 13);
		}
		else
			flags.SetBool('M04_Hotel_Cleared', False,, 6);
	}

	//== For looks, let's remove the items from the player's belt
	//==  before they get sent to MJ12 HQ, rather than after.
	//==  (the items are still in inventory though)
	else if(localURL == "04_NYC_BATTERYPARK")
	{
		for(count=0; count < 10; count++)
		{
			if(DeusExRootWindow(Player.rootWindow).hud.belt.objects[count].GetItem() != None && !DeusExRootWindow(Player.rootWindow).hud.belt.objects[count].GetItem().IsA('NanoKeyRing'))
			{
				DeusExRootWindow(Player.rootWindow).hud.belt.objects[count].GetItem().bInObjectBelt = False;
				DeusExRootWindow(Player.rootWindow).hud.belt.objects[count].GetItem().beltPos = -1;
			}
		}

		DeusExRootWindow(Player.rootWindow).hud.belt.ClearBelt();
	}

	else if(localURL == "04_NYC_UNATCOHQ")
	{
		count = 0;
		foreach AllActors(class'Inventory', item)
		{
			//== Introducing JC's storage locker, AKA his office
			if(item.Location.X <= 104.0000 && item.Location.X >= -432.0000 && item.Location.Y <= 1424.0000 && item.Location.Y >= 1018.0000 && item.Location.Z >= 232.0000 && item.Location.Z <= 400.0000 && !item.IsA('NanoKeyRing') && ScriptedPawn(item.Owner) == None && DeusExPlayer(item.Owner) == None)
			{
				tname = DeusExRootWindow(Player.rootWindow).StringToName("M04_JC_Item_"$ count);

				//== For whatever reason, we have to set the flag like this
				Player.flagBase.SetName(tname, item.Class.Name);
				Player.flagBase.SetExpiration(tname, FLAG_Name, 6);

				if(item.invSlotsX * item.invSlotsY > 4 && item.Location.Z <= 330.000000)
					Player.flagBase.SetBool('M04_JC_LeftHeavyItemOnFloor', True,, 6);

				if(item.IsA('DeusExWeapon'))
				{
					tname = DeusExRootWindow(Player.rootWindow).StringToName("M04_JC_Item_"$ count $"_bHasLaser");
					Player.flagBase.SetBool(tname, True,, 6);
					if(!DeusExWeapon(item).bCanHaveLaser)
						Player.flagBase.DeleteFlag(tname, FLAG_Bool);

					tname = DeusExRootWindow(Player.rootWindow).StringToName("M04_JC_Item_"$ count $"_bHasSilencer");
					Player.flagBase.SetBool(tname, True,, 6);
					if(!DeusExWeapon(item).bCanHaveSilencer)
						Player.flagBase.DeleteFlag(tname, FLAG_Bool);

					tname = DeusExRootWindow(Player.rootWindow).StringToName("M04_JC_Item_"$ count $"_bHasScope");
					Player.flagBase.SetBool(tname, True,, 6);
					if(!DeusExWeapon(item).bCanHaveScope)
						Player.flagBase.DeleteFlag(tname, FLAG_Bool);

					tname = DeusExRootWindow(Player.rootWindow).StringToName("M04_JC_Item_"$ count $"_ModBaseAccuracy");
					Player.flagBase.SetFloat(tname, DeusExWeapon(item).ModBaseAccuracy,, 6);
					if(!DeusExWeapon(item).bCanHaveModBaseAccuracy)
						Player.flagBase.DeleteFlag(tname, FLAG_Float);

					tname = DeusExRootWindow(Player.rootWindow).StringToName("M04_JC_Item_"$ count $"_ModReloadCount");
					Player.flagBase.SetFloat(tname, DeusExWeapon(item).ModReloadCount,, 6);
					if(!DeusExWeapon(item).bCanHaveModReloadCount)
						Player.flagBase.DeleteFlag(tname, FLAG_Float);

					tname = DeusExRootWindow(Player.rootWindow).StringToName("M04_JC_Item_"$ count $"_ModAccurateRange");
					Player.flagBase.SetFloat(tname, DeusExWeapon(item).ModAccurateRange,, 6);
					if(!DeusExWeapon(item).bCanHaveModAccurateRange)
						Player.flagBase.DeleteFlag(tname, FLAG_Float);

					tname = DeusExRootWindow(Player.rootWindow).StringToName("M04_JC_Item_"$ count $"_ModReloadTime");
					Player.flagBase.SetFloat(tname, DeusExWeapon(item).ModReloadTime,, 6);
					if(!DeusExWeapon(item).bCanHaveModReloadTime)
						Player.flagBase.DeleteFlag(tname, FLAG_Float);

					tname = DeusExRootWindow(Player.rootWindow).StringToName("M04_JC_Item_"$ count $"_ModRecoilStrength");
					Player.flagBase.SetFloat(tname, DeusExWeapon(item).ModRecoilStrength,, 6);
					if(!DeusExWeapon(item).bCanHaveModRecoilStrength)
						Player.flagBase.DeleteFlag(tname, FLAG_Float);

					tname = DeusExRootWindow(Player.rootWindow).StringToName("M04_JC_Item_"$ count $"_ModShotTime");
					Player.flagBase.SetFloat(tname, DeusExWeapon(item).ModShotTime,, 6);
					if(!DeusExWeapon(item).bCanHaveModShotTime)
						Player.flagBase.DeleteFlag(tname, FLAG_Float);

				}
				else if(item.IsA('AugmentationCannister'))
				{
					tname = DeusExRootWindow(Player.rootWindow).StringToName("M04_JC_Item_"$ count $"_Aug1");
					Player.flagBase.SetName(tname, AugmentationCannister(item).AddAugs[0]);
					Player.flagBase.SetExpiration(tname, FLAG_Name, 6);

					tname = DeusExRootWindow(Player.rootWindow).StringToName("M04_JC_Item_"$ count $"_Aug2");
					Player.flagBase.SetName(tname, AugmentationCannister(item).AddAugs[1]);
					Player.flagBase.SetExpiration(tname, FLAG_Name, 6);
				}

				count++;
			}
			//== Make a deliniating endpoint, in case someone comes back and takes/adds stuff
			tname = DeusExRootWindow(Player.rootWindow).StringToName("M04_JC_Item_"$ count);
			Player.flagBase.SetName(tname, '');
			Player.flagBase.SetExpiration(tname, FLAG_Name, 6);
		}
	}

	Super.PreTravel();
}

// ----------------------------------------------------------------------
// Timer()
//
// Main state machine for the mission
// ----------------------------------------------------------------------

function Timer()
{
	local ScriptedPawn pawn;
	local SatelliteDish dish;
	local SandraRenton Sandra;
	local GilbertRenton Gilbert;
	local GilbertRentonCarcass GilbertCarc;
	local SandraRentonCarcass SandraCarc;
	local UNATCOTroop troop;
	local Actor A;
	local PaulDenton Paul;
	local int count;
	local FordSchick Ford;

	Super.Timer();

	// do this for every map in this mission
	// if the player is "killed" after a certain flag, he is sent to mission 5
	if (!flags.GetBool('MS_PlayerCaptured'))
	{
		if (flags.GetBool('TalkedToPaulAfterMessage_Played'))
		{
			if (Player.IsInState('Dying'))
			{
				flags.SetBool('MS_PlayerCaptured', True,, 5);
				for(count=0; count < 10; count++)
				{
					if(DeusExRootWindow(Player.rootWindow).hud.belt.objects[count].GetItem() != None && !DeusExRootWindow(Player.rootWindow).hud.belt.objects[count].GetItem().IsA('NanoKeyRing'))
					{
						DeusExRootWindow(Player.rootWindow).hud.belt.objects[count].GetItem().bInObjectBelt = False;
						DeusExRootWindow(Player.rootWindow).hud.belt.objects[count].GetItem().beltPos = -1;
					}
				}
				DeusExRootWindow(Player.rootWindow).hud.belt.ClearBelt();
				Player.GoalCompleted('EscapeToBatteryPark');
				Level.Game.SendPlayer(Player, "05_NYC_UNATCOMJ12Lab");
			}
		}
	}

	if (localURL == "04_NYC_HOTEL")
	{
		// check to see if the player has killed either Sandra or Gilbert
		if (!flags.GetBool('PlayerKilledRenton'))
		{
			count = 0;
			foreach AllActors(class'SandraRenton', Sandra)
				count++;

			foreach AllActors(class'GilbertRenton', Gilbert)
				count++;

			foreach AllActors(class'SandraRentonCarcass', SandraCarc)
				if (SandraCarc.KillerBindName == "JCDenton")
					count = 0;

			foreach AllActors(class'GilbertRentonCarcass', GilbertCarc)
				if (GilbertCarc.KillerBindName == "JCDenton")
					count = 0;

			if (count < 2)
			{
				flags.SetBool('PlayerKilledRenton', True,, 5);
				foreach AllActors(class'Actor', A, 'RentonsHatePlayer')
					A.Trigger(Self, Player);
			}
		}

		if (flags.GetBool('InterruptFamilySquabble_Played') && !flags.GetBool('GaveRentonGun') && !flags.GetBool('JoJoFine_Dead') && !flags.GetBool('GilbertRenton_Dead') && !flags.GetBool('M04_GilbertRenton_Equippable'))
		{
			foreach AllActors(class'GilbertRenton', Gilbert)
			{
				Gilbert.bCanGiveWeapon = True;
				flags.SetBool('M04_GilbertRenton_Equippable',True,,5);
			}
		}

		if (flags.GetBool('GilbertRenton_Equippable') && !flags.GetBool('GilbertRenton_Dead'))
		{
			//== If we've given him a weapon, start the "thanks for the weapon" part of the give conversation
			if(flags.GetBool('GilbertRenton_Equipped') && !flags.GetBool('M04_RentonGiveConvoReduxActive'))
			{
				foreach AllActors(class'GilbertRenton', Gilbert)
				{
					if(Player.StartConversationByName('InterruptFamilySquabble', Gilbert, False, False, "GiveCommon"))
					{
						flags.SetBool('RentonGiveConvoReduxActive',True,,5);
						Gilbert.bCanGiveWeapon = False;
					}
				}
			}

			if(flags.GetBool('GaveRentonGun') || flags.GetBool('JoJoFine_Dead'))
			{
				flags.SetBool('M04_GilbertRenton_Equippable',False,,4);
				flags.SetBool('M04_RentonGiveConvoReduxActive',False,,4);
			}
		}

		if (!flags.GetBool('M04RaidTeleportDone') &&
			flags.GetBool('ApartmentEntered'))
		{
			if (flags.GetBool('NSFSignalSent'))
			{
				foreach AllActors(class'ScriptedPawn', pawn)
				{
					if (pawn.IsA('UNATCOTroop') || pawn.IsA('MIB'))
						pawn.EnterWorld();
					else if (pawn.IsA('SandraRenton') || pawn.IsA('GilbertRenton') || pawn.IsA('HarleyFilben'))
						pawn.LeaveWorld();
				}

				foreach AllActors(class'PaulDenton', Paul)
				{
					Player.StartConversationByName('TalkedToPaulAfterMessage', Paul, False, False);
					break;
				}

				flags.SetBool('M04RaidTeleportDone', True,, 5);
			}
		}
		// Sometimes the game gets a little... goofy on tracking if you're in the apartment
		else if (!flags.GetBool('M04RaidTeleportDone') && !flags.GetBool('ApartmentEntered'))
		{
			if(flags.GetBool('NSFSignalSent'))
			{
				foreach AllActors(class'PaulDenton', Paul)
				{
					count = Abs(VSize(Player.Location - Paul.Location));
					if(count < 120 && Player.Location.X > -410.000000 && Player.Location.Y > -2990.000000)
						flags.SetBool('ApartmentEntered', True,, 5);
				}
			}
		}

		// make the MIBs mortal
		if (!flags.GetBool('MS_MIBMortal'))
		{
			if (flags.GetBool('TalkedToPaulAfterMessage_Played'))
			{
				foreach AllActors(class'ScriptedPawn', pawn)
					if (pawn.IsA('MIB'))
						pawn.bInvincible = False;

				flags.SetBool('MS_MIBMortal', True,, 5);
			}
		}

		// unhide the correct JoJo
		if (!flags.GetBool('MS_JoJoUnhidden') &&
			(flags.GetBool('SandraWaitingForJoJoBarks_Played') ||
			flags.GetBool('GilbertWaitingForJoJoBarks_Played')))
		{
			if (!flags.GetBool('JoJoFine_Dead'))
			{
				foreach AllActors(class'ScriptedPawn', pawn, 'JoJoUpstairs')
					pawn.EnterWorld();

				flags.SetBool('MS_JoJoUnhidden', True,, 5);
			}
		}

		// unhide the correct JoJo
		if (!flags.GetBool('MS_JoJoUnhidden') &&
			(flags.GetBool('M03OverhearSquabble_Played') &&
			!flags.GetBool('JoJoOverheard_Played') &&
			flags.GetBool('JoJoEntrance')))
		{
			if (!flags.GetBool('JoJoFine_Dead'))
			{
				foreach AllActors(class'ScriptedPawn', pawn, 'JoJoUpstairs')
					pawn.EnterWorld();

				flags.SetBool('MS_JoJoUnhidden', True,, 5);
			}
		}

		// trigger some stuff based on convo flags
		if (flags.GetBool('JoJoOverheard_Played') && !flags.GetBool('MS_JoJo1Triggered'))
		{
			if (flags.GetBool('GaveRentonGun'))
			{
				foreach AllActors(class'Actor', A, 'GilbertAttacksJoJo')
					A.Trigger(Self, Player);
			}
			else
			{
				foreach AllActors(class'Actor', A, 'JoJoAttacksGilbert')
					A.Trigger(Self, Player);
			}

			flags.SetBool('MS_JoJo1Triggered', True,, 5);
		}

		// trigger some stuff based on convo flags
		if (flags.GetBool('JoJoAndSandraOverheard_Played') && !flags.GetBool('MS_JoJo2Triggered'))
		{
			foreach AllActors(class'Actor', A, 'SandraLeaves')
				A.Trigger(Self, Player);

			flags.SetBool('MS_JoJo2Triggered', True,, 5);
		}

		// trigger some stuff based on convo flags
		if (flags.GetBool('JoJoAndGilbertOverheard_Played') && !flags.GetBool('MS_JoJo3Triggered'))
		{
			foreach AllActors(class'Actor', A, 'JoJoAttacksGilbert')
				A.Trigger(Self, Player);

			flags.SetBool('MS_JoJo3Triggered', True,, 5);
		}
	}
	else if (localURL == "04_NYC_NSFHQ")
	{
		// rotate the dish when the computer sets the flag
		if (!flags.GetBool('MS_Dish1Rotated'))
		{
			if (flags.GetBool('Dish1InPosition'))
			{
				foreach AllActors(class'SatelliteDish', dish, 'Dish1')
					dish.DesiredRotation.Yaw = 49152;

				flags.SetBool('MS_Dish1Rotated', True,, 5);
			}
		}

		// rotate the dish when the computer sets the flag
		if (!flags.GetBool('MS_Dish2Rotated'))
		{
			if (flags.GetBool('Dish2InPosition'))
			{
				foreach AllActors(class'SatelliteDish', dish, 'Dish2')
					dish.DesiredRotation.Yaw = 0;

				flags.SetBool('MS_Dish2Rotated', True,, 5);
			}
		}

		// rotate the dish when the computer sets the flag
		if (!flags.GetBool('MS_Dish3Rotated'))
		{
			if (flags.GetBool('Dish3InPosition'))
			{
				foreach AllActors(class'SatelliteDish', dish, 'Dish3')
					dish.DesiredRotation.Yaw = 16384;

				flags.SetBool('MS_Dish3Rotated', True,, 5);
			}
		}

		// set a flag when all dishes are rotated
		if (!flags.GetBool('CanSendSignal'))
		{
			if (flags.GetBool('Dish1InPosition') &&
				flags.GetBool('Dish2InPosition') &&
				flags.GetBool('Dish3InPosition'))
				flags.SetBool('CanSendSignal', True,, 5);
		}

		// count non-living troops
		if (!flags.GetBool('MostWarehouseTroopsDead'))
		{
			count = 0;
			foreach AllActors(class'UNATCOTroop', troop)
				count++;

			// if two or less are still alive
			if (count <= 2)
				flags.SetBool('MostWarehouseTroopsDead', True);
		}
	}
	else if(localURL == "04_NYC_SMUG")
	{
		if(flags.getBool('FordSchickRescued'))
		{
			if(!flags.getBool('M04_FordShick_Appeared'))
			{
				foreach AllActors(class'FordSchick', Ford)
				{
					Ford.EnterWorld();
					flags.SetBool('M04_FordSchick_Appeared', True,, 5);
				}
			}
		}
	}
}

// ----------------------------------------------------------------------
// ----------------------------------------------------------------------

defaultproperties
{
}
