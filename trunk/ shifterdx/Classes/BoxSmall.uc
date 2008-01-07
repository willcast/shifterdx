//=============================================================================
// BoxSmall.
//=============================================================================
class BoxSmall extends Containers;

simulated function PreBeginPlay()
{
	Super.PreBeginPlay();

	Mesh = mesh(DynamicLoadObject("HDTPDecos.HDTPboxsmall", class'mesh', True));

	if(Mesh == None)
		Mesh = Default.Mesh;
}

defaultproperties
{
     HitPoints=5
     FragType=Class'DeusEx.PaperFragment'
     ItemName="Cardboard Box"
     bBlockSight=True
     Mesh=LodMesh'DeusExDeco.BoxSmall'
     CollisionRadius=13.000000
     CollisionHeight=5.180000
     Mass=20.000000
     Buoyancy=30.000000
}
