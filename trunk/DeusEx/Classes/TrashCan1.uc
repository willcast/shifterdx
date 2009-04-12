//=============================================================================
// TrashCan1.
//=============================================================================
class TrashCan1 extends Containers;

function Facelift(bool bOn)
{
	Super.Facelift(bOn);

	if(bOn)
		Mesh = mesh(DynamicLoadObject("HDTPDecos.HDTPtrashcan1", class'mesh', True));

	if(Mesh == None || !bOn)
		Mesh = Default.Mesh;
}

defaultproperties
{
     bGenerateTrash=True
     ItemName="Trashcan"
     Mesh=LodMesh'DeusExDeco.TrashCan1'
     CollisionRadius=19.250000
     CollisionHeight=33.000000
     Mass=50.000000
     Buoyancy=60.000000
}
