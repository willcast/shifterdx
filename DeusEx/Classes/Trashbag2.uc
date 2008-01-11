//=============================================================================
// Trashbag2.
//=============================================================================
class Trashbag2 extends Containers;

function Facelift(bool bOn)
{
	if(bOn)
		Mesh = mesh(DynamicLoadObject("HDTPDecos.HDTPtrashbag2", class'mesh', True));

	if(Mesh == None || !bOn)
		Mesh = Default.Mesh;
}

defaultproperties
{
     bGenerateTrash=True
     HitPoints=10
     FragType=Class'DeusEx.PaperFragment'
     bGenerateFlies=True
     ItemName="Trashbag"
     Mesh=LodMesh'DeusExDeco.Trashbag2'
     CollisionRadius=19.610001
     CollisionHeight=16.700001
     Mass=30.000000
     Buoyancy=40.000000
}
