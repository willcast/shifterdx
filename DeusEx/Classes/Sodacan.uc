//=============================================================================
// Sodacan.
//=============================================================================
class Sodacan extends DeusExPickup;

enum ESkinColor
{
	SC_Default,
	SC_Nuke,
	SC_Zap,
	SC_Burn,
	SC_Blast
};

var() ESkinColor StackSkins[10]; //Should match the maxCopies var

var localized String InvDescription[4];

function Facelift(bool bOn)
{
	local int skinnum;
	local Texture otherIcon;

	if(numCopies > 1 && numCopies <= 10) //Default.maxCopies
	{
		skinnum = StackSkins[numCopies - 1];
		if(skinnum < 1 || skinnum > 4)
		{
			StackSkins[numCopies - 1] = RandomCanTex();
			skinnum = StackSkins[numCopies - 1];
		}
	}
	else
	{
		skinnum = StackSkins[0];
		if(skinnum < 1 || skinnum > 4)
		{
			StackSkins[0] = RandomCanTex();
			skinnum = StackSkins[0];
		}
	}

	if(bOn)
		Mesh = mesh(DynamicLoadObject("HDTPItems.HDTPsodacan", class'mesh', True));

	if(Mesh == None || !bOn || skinnum > 1)
	{
		Mesh = Default.Mesh;
		PlayerViewMesh = Default.PlayerViewMesh;
		PickupViewMesh = Default.PickupViewMesh;
		ThirdPersonMesh = Default.ThirdPersonMesh;
		Skin = Texture(DynamicLoadObject("DeusExItems.SodaCanTex"$ skinnum, class'Texture', False));
	}
	else
	{
		PlayerViewMesh = Mesh;
		PickupViewMesh = Mesh;
		ThirdPersonMesh = Mesh;
		Skin = Texture(DynamicLoadObject("HDTPItems.HDTPSodacantex"$ skinnum, class'Texture', False));
	}

	MultiSkins[1] = Skin;

	switch(skinnum)
	{
		case 0:
		case 1:
			ItemName = default.ItemName $ " (Nuke!)";
			beltDescription = "NUKE!";
			Icon = Default.Icon;
			LargeIcon = Default.LargeIcon;
			break;
		case 2:
			ItemName = default.ItemName $ " (Zap!)";
			beltDescription = "ZAP!";
			if(bOn) //Hey, we can dynamic load for HDTP, why not for Zodiac too
			{
				otherIcon = Texture(DynamicLoadObject("Zodiac.Icons.BeltIconZapSodaCan", class'Texture', True));
				if(otherIcon != None)
					Icon = otherIcon;

				otherIcon = Texture(DynamicLoadObject("Zodiac.Icons.LargeIconZapSodaCan", class'Texture', True));
				if(otherIcon != None)
					LargeIcon = otherIcon;
			}
			else
			{
				Icon = Default.Icon;
				LargeIcon = Default.LargeIcon;
			}
			break;
		case 3:
			ItemName = default.ItemName $ " (Burn!)";
			beltDescription = "BURN!";
			Icon = Default.Icon;
			LargeIcon = Default.LargeIcon;
			break;
		case 4:
			ItemName = default.ItemName $ " (Blast!)";
			beltDescription = "BLAST!";
			Icon = Default.Icon;
			LargeIcon = Default.LargeIcon;
			break;
	}

	Description = InvDescription[skinnum - 1];
}

function PreBeginPlay()
{
	local Sodacan soda;

	//== Hack.  Check for Zodiac's Zap! Soda and replace it with a normal Soda can
	//==  set to SkinType SC_Zap and delete the existing... but only if we aren't
	//==  in someone's inventory already
	if(String(Class.Name) == "ZapSodaCan" && Pawn(Owner) == None)
	{
		soda = spawn(class'Sodacan', Owner);
		soda.StackSkins[0] = SC_Zap;
		soda.Facelift(True);
		Destroy();
		return;
	}

	Super.PreBeginPlay();

}

function ESkinColor RandomCanTex()
{
	local Sodacan soda;

	//=== There's a random chance we'll have a different soda label
	if(frand() > 0.25)
	{
		//== Check for any soda in a 2ft range.  Clusters of Nuke should stay as Nuke
		foreach RadiusActors(class'Sodacan', soda, 32)
		{
			if((soda.StackSkins[0] == SC_Default || soda.StackSkins[0] == SC_Nuke) && soda != Self)
				return SC_Nuke;
		}

		switch(Rand(6))
		{
			case 0:
			case 3:
				return SC_Zap;
				break;

			case 1:
			case 4:
				return SC_Burn;
				break;

			case 2:
			case 5:
				return SC_Blast;
				break;
		}
	}

	return SC_Nuke;		
}

function TransferSkin(Inventory inv)
{
	StackSkins[numCopies - 1] = Sodacan(inv).StackSkins[DeusExPickup(inv).numCopies];

	if(Level.NetMode == NM_Standalone)
	{
		Facelift(True);
		DeusExPickup(inv).Facelift(True);
	}
}

function UseOnce()
{
	Super.UseOnce();

	if(numCopies > 0 && Level.NetMode == NM_Standalone)
		Facelift(True);
}

//== Look ma, we can switch between food items now
function SwitchItem()
{
	local Class<DeusExPickup> SwitchList[7];
	local Inventory inv;
	local int i;
	local DeusExPlayer P;

	P = DeusExPlayer(Owner);

	i = 0;

	//== Comment out the self reference here and we're done
//	SwitchList[i++] = class'Sodacan';
	SwitchList[i++] = class'SoyFood';
	SwitchList[i++] = class'WineBottle';
	SwitchList[i++] = class'VialCrack';
	SwitchList[i++] = class'Candybar';
	SwitchList[i++] = class'Cigarettes';
	SwitchList[i++] = class'Liquor40oz';
	SwitchList[i++] = class'LiquorBottle';

	for(i = 0; i < 6; i++)
	{
		inv = P.FindInventoryType(SwitchList[i]);

		if(inv != None)
		{
			if(inv.beltPos == -1)
			{
				P.ClientMessage(Sprintf(SwitchingTo,inv.ItemName));
				P.AddObjectToBelt(inv,Self.beltPos,false);
				P.PutInHand(inv);
				i = 7;
				break;
			}
		}
	}
}

state Activated
{
	function Activate()
	{
		// can't turn it off
	}

	function BeginState()
	{
		local DeusExPlayer player;
		local int mult;
		
		Super.BeginState();

		if(numCopies > 0 && numCopies <= 10)
			mult = StackSkins[numCopies - 1];
		else
			mult = StackSkins[0];

		player = DeusExPlayer(Owner);
		if (player != None)
		{
			if(player.SkillSystem != None)
				mult += player.SkillSystem.GetSkillLevel(class'SkillMedicine') + 1;

			//== Health gained is based on the color of the can
			player.HealPlayer(mult, False);
			//Either reduces your drunkenness or extends your zyme high
			if(player.drugEffectTimer > 4.0 || player.drugEffectTimer < 0.0)
				player.drugEffectTimer -= 4.0;
			else
				player.drugEffectTimer = 0.0;			
		}

		PlaySound(sound'MaleBurp');
		UseOnce();
	}
Begin:
}

defaultproperties
{
     maxCopies=10
     bCanHaveMultipleCopies=True
     bActivatable=True
     ItemName="Soda"
     ItemArticle="some"
     PlayerViewOffset=(X=30.000000,Z=-12.000000)
     PlayerViewMesh=LodMesh'DeusExItems.Sodacan'
     PickupViewMesh=LodMesh'DeusExItems.Sodacan'
     ThirdPersonMesh=LodMesh'DeusExItems.Sodacan'
     LandSound=Sound'DeusExSounds.Generic.MetalHit1'
     Icon=Texture'DeusExUI.Icons.BeltIconSodaCan'
     largeIcon=Texture'DeusExUI.Icons.LargeIconSodaCan'
     largeIconWidth=24
     largeIconHeight=45
     Description="The can is blank except for the phrase 'PRODUCT PLACEMENT HERE.' It is unclear whether this is a name or an invitation."
     beltDescription="SODA"
     Mesh=LodMesh'DeusExItems.Sodacan'
     CollisionRadius=3.000000
     CollisionHeight=4.500000
     Mass=5.000000
     Buoyancy=3.000000
     InvDescription(0)="The can is blank except for the phrase 'PRODUCT PLACEMENT HERE.' It is unclear whether this is a name or an invitation."
     InvDescription(1)="A can of Zap! soda.  The label reads: '50% more effective than Nuke!'"
     InvDescription(2)="The only easily visible item is the letter 'B' printed on the front.  The small information label reads 'Beats out Zap! by a factor of 1.3333333333333333333333333333333333....'|n|nThe numbers keep repeating and appear to take up the remaining space on the label."
     InvDescription(3)="Aside from the bold-face title the can appears to be blank.  Closer inspection shows the original printing has been removed and a new name printed on top.  The words 'got Electrolytes' and 'Thirst Mutilator' are still barely visible."
}
