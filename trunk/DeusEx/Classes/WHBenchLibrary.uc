//=============================================================================
// WHBenchLibrary.
//=============================================================================
class WHBenchLibrary extends Seat;

function Facelift(bool bOn)
{
	Super.Facelift(bOn);

	if(bOn)
		Mesh = mesh(DynamicLoadObject("HDTPDecos.HDTPWHBenchLibrary", class'mesh', True));

	if(Mesh == None || !bOn)
		Mesh = Default.Mesh;
}

defaultproperties
{
     sitPoint(0)=(X=0.000000,Y=0.000000,Z=0.000000)
     ItemName="Bench"
     Mesh=LodMesh'DeusExDeco.WHBenchLibrary'
     CollisionRadius=56.000000
     CollisionHeight=34.000000
     Mass=25.000000
     Buoyancy=5.000000
}
