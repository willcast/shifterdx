//=============================================================================
// TrashCan3.
//=============================================================================
class TrashCan3 extends Containers;

simulated function PreBeginPlay()
{
	Super.PreBeginPlay();

	Mesh = mesh(DynamicLoadObject("HDTPDecos.HDTPtrashcan3", class'mesh', True));

	if(Mesh == None)
		Mesh = Default.Mesh;
}

defaultproperties
{
     bGenerateTrash=True
     bGenerateFlies=True
     ItemName="Trashcan"
     Mesh=LodMesh'DeusExDeco.TrashCan3'
     CollisionRadius=24.000000
     CollisionHeight=30.500000
     Mass=40.000000
     Buoyancy=50.000000
}