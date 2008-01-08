//=============================================================================
// WHBenchEast.
//=============================================================================
class WHBenchEast extends Seat;

simulated function PreBeginPlay()
{
	Super.PreBeginPlay();

	Mesh = mesh(DynamicLoadObject("HDTPDecos.HDTPWHBenchEast", class'mesh', True));

	if(Mesh == None)
		Mesh = Default.Mesh;
}

defaultproperties
{
     sitPoint(0)=(X=-5.000000,Y=0.000000,Z=0.000000)
     sitPoint(1)=(X=5.000000,Y=0.000000,Z=0.000000)
     ItemName="Bench"
     Mesh=LodMesh'DeusExDeco.WHBenchEast'
     CollisionRadius=27.000000
     CollisionHeight=17.000000
     Mass=25.000000
     Buoyancy=5.000000
}