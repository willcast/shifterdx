//=============================================================================
// Mailbox.
//=============================================================================
class Mailbox extends Containers;

function Facelift(bool bOn)
{
	if(bOn)
		Mesh = mesh(DynamicLoadObject("HDTPDecos.HDTPmailbox", class'mesh', True));

	if(Mesh == None || !bOn)
		Mesh = Default.Mesh;
}

defaultproperties
{
     ItemName="Mailbox"
     bPushable=False
     Physics=PHYS_None
     Mesh=LodMesh'DeusExDeco.Mailbox'
     CollisionHeight=36.500000
     Mass=400.000000
     Buoyancy=200.000000
}