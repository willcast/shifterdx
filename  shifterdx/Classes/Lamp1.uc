//=============================================================================
// Lamp1.
//=============================================================================
class Lamp1 extends Lamp;

simulated function PreBeginPlay()
{
	Super.PreBeginPlay();

	Mesh = mesh(DynamicLoadObject("HDTPDecos.HDTPlamp1", class'mesh', True));

	if(Mesh == None)
		Mesh = Default.Mesh;
}

defaultproperties
{
     ItemName="Table Lamp"
     Mesh=LodMesh'DeusExDeco.Lamp1'
     CollisionRadius=17.000000
     CollisionHeight=24.389999
     LightBrightness=192
     LightHue=44
     LightSaturation=128
     LightRadius=8
     Mass=40.000000
     Buoyancy=10.000000
}
