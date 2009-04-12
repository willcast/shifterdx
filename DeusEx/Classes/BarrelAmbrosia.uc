//=============================================================================
// BarrelAmbrosia.
//=============================================================================
class BarrelAmbrosia extends Containers;

function Facelift(bool bOn)
{
	Super.Facelift(bOn);

	if(bOn)
		Mesh = mesh(DynamicLoadObject("HDTPDecos.HDTPbarrelambrosia", class'mesh', True));

	if(Mesh == None || !bOn)
		Mesh = Default.Mesh;
}

defaultproperties
{
     HitPoints=30
     bInvincible=True
     bFlammable=False
     ItemName="Ambrosia Storage Container"
     bBlockSight=True
     Mesh=LodMesh'DeusExDeco.BarrelAmbrosia'
     CollisionRadius=16.000000
     CollisionHeight=28.770000
     LightType=LT_Steady
     LightEffect=LE_WateryShimmer
     LightBrightness=96
     LightHue=80
     LightRadius=4
     Mass=80.000000
     Buoyancy=90.000000
}
