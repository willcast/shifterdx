//=============================================================================
// Candybar.
//=============================================================================
class Candybar extends DeusExPickup;

simulated function BeginPlay()
{
	Super.BeginPlay();

	if(Rand(2) == 1)
		Skin = Texture'CandybarTex2';
}

function Facelift(bool bOn)
{
	local Texture lSkin;

	lSkin = Skin;

	if(bOn && lSkin != Texture'CandybarTex2')
		Skin = Texture(DynamicLoadObject("HDTPItems.Skins.HDTPCandybartex1", class'Texture', true));

	if(Skin == None || !bOn)
	{
		if(lSkin == Texture'CandybarTex2')
			Skin = lSkin;

		else
			Skin = None;
	}

}

//== Look ma, we can switch between food items now
function SwitchItem()
{
	local Class<DeusExPickup> SwitchList[6];
	local Inventory inv;
	local int i;
	local DeusExPlayer P;

	P = DeusExPlayer(Owner);

	i = 0;

	//== Comment out the self reference here and we're done
//	SwitchList[i++] = class'Candybar';
	SwitchList[i++] = class'Liquor40oz';
	SwitchList[i++] = class'LiquorBottle';
	SwitchList[i++] = class'Sodacan';
	SwitchList[i++] = class'SoyFood';
	SwitchList[i++] = class'WineBottle';
	SwitchList[i++] = class'VialCrack';

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
				i = 6;
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

		player = DeusExPlayer(Owner);
		if (player != None)
		{
			if(player.SkillSystem != None)
				mult = player.SkillSystem.GetSkillLevel(class'SkillMedicine') + 1;

//			player.HealPlayer(3, False);
			player.HealPlayer(2 + mult, False);
		}
		
		UseOnce();
	}
Begin:
}

defaultproperties
{
     maxCopies=20
     bCanHaveMultipleCopies=True
     bActivatable=True
     ItemName="Candy Bar"
     PlayerViewOffset=(X=30.000000,Z=-12.000000)
     PlayerViewMesh=LodMesh'DeusExItems.Candybar'
     PickupViewMesh=LodMesh'DeusExItems.Candybar'
     ThirdPersonMesh=LodMesh'DeusExItems.Candybar'
     Icon=Texture'DeusExUI.Icons.BeltIconCandyBar'
     largeIcon=Texture'DeusExUI.Icons.LargeIconCandyBar'
     largeIconWidth=46
     largeIconHeight=36
     Description="'CHOC-O-LENT DREAM. IT'S CHOCOLATE! IT'S PEOPLE! IT'S BOTH!(tm) 85% Recycled Material.'"
     beltDescription="CANDY BAR"
     Mesh=LodMesh'DeusExItems.Candybar'
     CollisionRadius=6.250000
     CollisionHeight=0.670000
     Mass=3.000000
     Buoyancy=4.000000
}