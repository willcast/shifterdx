//=============================================================================
// DataCube.
//=============================================================================
class DataCube extends InformationDevices;

simulated function PreBeginPlay()
{
	Super.PreBeginPlay();

	Skin = Texture(DynamicLoadObject("HDTPItems.Skins.HDTPDatacubetex1", class'Texture', True));
	if(Skin != None)
	{
		Texture = Texture'Effects.Corona.Corona_G';
		MultiSkins[2] = Skin;
	}
}

event FellOutOfWorld()
{
	log("Datacube exited the world at " $ Location $". Was using tag "$ textTag $" and package "$ TextPackage);

	Super.FellOutOfWorld();
}

defaultproperties
{
     bAddToVault=True
     bInvincible=True
     bCanBeBase=True
     ItemName="DataCube"
     Texture=Texture'DeusExItems.Skins.DataCubeTex2'
     Mesh=LodMesh'DeusExItems.DataCube'
     CollisionRadius=7.000000
     CollisionHeight=1.270000
     Mass=2.000000
     Buoyancy=3.000000
}