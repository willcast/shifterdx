//=============================================================================
// TrashCan3.
//=============================================================================
class TrashCan3 extends Containers;

function bool Facelift(bool bOn)
{
	if(!Super.Facelift(bOn))
		return false;

	if(bOn)
		Mesh = mesh(DynamicLoadObject("HDTPDecos.HDTPtrashcan3", class'mesh', True));

	if(Mesh == None || !bOn)
		Mesh = Default.Mesh;

	return true;
}

defaultproperties
{
     bLootable=True
     bRandomize=True
     bGenerateTrash=True
     bGenerateFlies=True
     ItemName="Trashcan"
     Mesh=LodMesh'DeusExDeco.TrashCan3'
     CollisionRadius=24.000000
     CollisionHeight=30.500000
     Mass=40.000000
     Buoyancy=50.000000
}
