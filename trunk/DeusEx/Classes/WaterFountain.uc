//=============================================================================
// WaterFountain.
//=============================================================================

// Modified -- Y|yukichigai

class WaterFountain extends DeusExDecoration;

var bool bUsing;
var int numUses;
var float mult;
var localized String msgEmpty;

simulated function PreBeginPlay()
{
	Super.PreBeginPlay();

	Mesh = mesh(DynamicLoadObject("HDTPDecos.HDTPWaterFountain", class'mesh', True));

	if(Mesh == None)
		Mesh = Default.Mesh;
}

function Timer()
{
	bUsing = False;
	PlayAnim('Still');
	AmbientSound = None;
}

function Frob(Actor Frobber, Inventory frobWith)
{
	Super.Frob(Frobber, frobWith);

	mult = 1.0;

	if (numUses <= 0)
	{
		if (Pawn(Frobber) != None)
			Pawn(Frobber).ClientMessage(msgEmpty);
		return;
	}

	if (bUsing)
		return;

	SetTimer(1.0, False); //Down from 2.0
	bUsing = True;

	// heal the frobber a small bit
	if (DeusExPlayer(Frobber) != None)
	{
		if(DeusExPlayer(Frobber).SkillSystem != None)
		{
			mult = DeusExPlayer(Frobber).SkillSystem.GetSkillLevelValue(class'SkillMedicine');
			if(mult <= 0) mult = 1.0;
			else if(mult == 2.5) mult = 3.0;
			else if(mult == 3.0) mult = 4.0;
		}
		DeusExPlayer(Frobber).HealPlayer(mult);
	}

	LoopAnim('Use');
	AmbientSound = sound'WaterBubbling';
	numUses--;
}

//Uses increased from 10

defaultproperties
{
     numUses=20
     msgEmpty="It's out of water"
     ItemName="Water Fountain"
     bPushable=False
     Physics=PHYS_None
     Mesh=LodMesh'DeusExDeco.WaterFountain'
     CollisionRadius=20.000000
     CollisionHeight=24.360001
     Mass=70.000000
     Buoyancy=100.000000
}