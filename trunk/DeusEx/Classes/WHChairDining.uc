//=============================================================================
// WHChairDining.
//=============================================================================
class WHChairDining extends Seat;

function Facelift(bool bOn)
{
	Super.Facelift(bOn);

	if(bOn)
		Mesh = mesh(DynamicLoadObject("HDTPDecos.HDTPWHChairDining", class'mesh', True));

	if(Mesh == None || !bOn)
		Mesh = Default.Mesh;
}

defaultproperties
{
     sitPoint(0)=(X=0.000000,Y=0.000000,Z=0.000000)
     ItemName="Chair"
     Mesh=LodMesh'DeusExDeco.WHChairDining'
     CollisionRadius=20.000000
     CollisionHeight=36.000000
     Mass=25.000000
     Buoyancy=5.000000
}
