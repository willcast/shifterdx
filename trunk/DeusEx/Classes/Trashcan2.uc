//=============================================================================
// Trashcan2.
//=============================================================================
class Trashcan2 extends Containers;

simulated function PreBeginPlay()
{
	Super.PreBeginPlay();

	Mesh = mesh(DynamicLoadObject("HDTPDecos.HDTPtrashcan2", class'mesh', True));

	if(Mesh == None)
		Mesh = Default.Mesh;
}

defaultproperties
{
     bGenerateTrash=True
     ItemName="Trashcan"
     Mesh=LodMesh'DeusExDeco.Trashcan2'
     CollisionRadius=14.860000
     CollisionHeight=24.049999
     Mass=40.000000
     Buoyancy=50.000000
}