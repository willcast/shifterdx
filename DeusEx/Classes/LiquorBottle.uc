//=============================================================================
// LiquorBottle.
//=============================================================================
class LiquorBottle extends DeusExPickup;

simulated function PreBeginPlay()
{
	Super.PreBeginPlay();

	Mesh = mesh(DynamicLoadObject("HDTPItems.HDTPLiquorBottle", class'mesh', True));

	if(Mesh == None)
		Mesh = Default.Mesh;
	else
	{
		PlayerViewMesh = Mesh;
		PickupViewMesh = Mesh;
		ThirdPersonMesh = Mesh;
		Texture = Texture(DynamicLoadObject("HDTPItems.Skins.HDTPLiquorBottletex2", class'Texture'));
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
		local float mult;
		
		Super.BeginState();

		player = DeusExPlayer(Owner);
		if (player != None)
		{
			if(player.SkillSystem != None)
			{
				mult = player.SkillSystem.GetSkillLevelValue(class'SkillMedicine');
				if(mult <= 0) mult = 1.0;
				else if(mult == 2.5) mult = 3.0;
				else if(mult == 3.0) mult = 4.0;
			}
//			player.HealPlayer(3, False);
			player.HealPlayer(2 + Int(mult), False);
			if(player.drugEffectTimer < 0.0 && player.drugEffectTimer >= -10.0)
				player.drugEffectTimer = -0.1;
			else
				player.drugEffectTimer += 10.0;
		}

		UseOnce();
	}
Begin:
}

defaultproperties
{
     bBreakable=True
     maxCopies=10
     bCanHaveMultipleCopies=True
     bActivatable=True
     ItemName="Liquor"
     ItemArticle="some"
     PlayerViewOffset=(X=30.000000,Z=-12.000000)
     PlayerViewMesh=LodMesh'DeusExItems.LiquorBottle'
     PickupViewMesh=LodMesh'DeusExItems.LiquorBottle'
     ThirdPersonMesh=LodMesh'DeusExItems.LiquorBottle'
     LandSound=Sound'DeusExSounds.Generic.GlassHit1'
     Icon=Texture'DeusExUI.Icons.BeltIconLiquorBottle'
     largeIcon=Texture'DeusExUI.Icons.LargeIconLiquorBottle'
     largeIconWidth=20
     largeIconHeight=48
     Description="The label is torn off, but it looks like some of the good stuff."
     beltDescription="LIQUOR"
     Mesh=LodMesh'DeusExItems.LiquorBottle'
     CollisionRadius=4.620000
     CollisionHeight=12.500000
     Mass=10.000000
     Buoyancy=8.000000
}
