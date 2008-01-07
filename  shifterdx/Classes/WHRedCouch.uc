//=============================================================================
// WHRedCouch.
//=============================================================================
class WHRedCouch extends Seat;

simulated function PreBeginPlay()
{
	Super.PreBeginPlay();

	Mesh = mesh(DynamicLoadObject("HDTPDecos.HDTPWHredcouch", class'mesh', True));

	if(Mesh == None)
		Mesh = Default.Mesh;
}

defaultproperties
{
     sitPoint(0)=(X=-5.000000,Y=0.000000,Z=0.000000)
     sitPoint(1)=(X=5.000000,Y=0.000000,Z=0.000000)
     ItemName="Couch"
     Mesh=LodMesh'DeusExDeco.WHRedCouch'
     CollisionRadius=55.000000
     CollisionHeight=26.000000
     Mass=200.000000
     Buoyancy=5.000000
}
