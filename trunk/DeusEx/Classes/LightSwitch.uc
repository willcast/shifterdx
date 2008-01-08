//=============================================================================
// LightSwitch.
//=============================================================================
class LightSwitch extends DeusExDecoration;

var bool bOn;

simulated function PreBeginPlay()
{
	local texture lSkin;

	Super.PreBeginPlay();

	lSkin = Texture(DynamicLoadObject("HDTPDecos.Skins.HDTPLightswitchTex1",class'Texture', True));

	if(lSkin != None)
		Skin = lSkin;
}

function Frob(Actor Frobber, Inventory frobWith)
{
	Super.Frob(Frobber, frobWith);


	if (bOn)
	{
		PlaySound(sound'Switch4ClickOff');
		PlayAnim('Off');
	}
	else
	{
		PlaySound(sound'Switch4ClickOn');
		PlayAnim('On');
	}

	bOn = !bOn;
}

defaultproperties
{
     bInvincible=True
     ItemName="Switch"
     bPushable=False
     Physics=PHYS_None
     Mesh=LodMesh'DeusExDeco.LightSwitch'
     CollisionRadius=3.750000
     CollisionHeight=6.250000
     Mass=30.000000
     Buoyancy=40.000000
}