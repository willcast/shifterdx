//=============================================================================
// Vase2.
//=============================================================================
class Vase2 extends DeusExDecoration;

simulated function PreBeginPlay()
{
	Super.PreBeginPlay();

	Mesh = mesh(DynamicLoadObject("HDTPDecos.HDTPvase2", class'mesh', True));

	if(Mesh == None)
		Mesh = Default.Mesh;
}

defaultproperties
{
     FragType=Class'DeusEx.GlassFragment'
     ItemName="Vase"
     Mesh=LodMesh'DeusExDeco.Vase2'
     CollisionRadius=7.540000
     CollisionHeight=5.080000
     Mass=20.000000
     Buoyancy=15.000000
}
