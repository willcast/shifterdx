//=============================================================================
// MenuChoice_Class
//=============================================================================

//[95] was [24] -- Y|yukichigai

class MenuChoice_Class extends MenuUIChoiceEnum
	config;

var globalconfig string  ClassClasses[95]; //Actual classes of classes (sigh)
var localized String     ClassNames[95]; //Human readable class names.


//Portrait variables
var ButtonWindow btnPortrait;
var globalconfig String texPortraits[95]; //Futureproofing for possible optional texture package
var int PortraitIndex;

// ----------------------------------------------------------------------
// InitWindow()
//
// Initialize the Window
// ----------------------------------------------------------------------

event InitWindow()
{
	PopulateClassChoices();
   CreatePortraitButton();

	Super.InitWindow();

   SetInitialClass();

   SetActionButtonWidth(153);

   btnAction.SetHelpText(HelpText);
   btnInfo.SetPos(0,195);
}

// ----------------------------------------------------------------------
// PopulateClassChoices()
// ----------------------------------------------------------------------

function PopulateClassChoices()
{
	local int typeIndex;

   for (typeIndex = 0; typeIndex < arrayCount(ClassNames); typeIndex++)
   {
      enumText[typeIndex]=ClassNames[typeIndex];
   }
}

// ----------------------------------------------------------------------
// SetInitialClass()
// ----------------------------------------------------------------------

function SetInitialClass()
{
   local string TypeString;
   local int typeIndex;

   
   TypeString = player.GetDefaultURL("Class");
  
   for (typeIndex = 0; typeIndex < arrayCount(ClassNames); typeIndex++)
   {
      if (TypeString==GetModuleName(typeIndex))
         SetValue(typeIndex);
   }
}

// ----------------------------------------------------------------------
// SetValue()
// ----------------------------------------------------------------------

function SetValue(int newValue)
{
   Super.SetValue(newValue);
   UpdatePortrait();
}

// ----------------------------------------------------------------------
// SaveSetting()
// ----------------------------------------------------------------------

function SaveSetting()
{
   player.UpdateURL("Class", GetModuleName(currentValue), true);
   player.SaveConfig();
}

// ----------------------------------------------------------------------
// LoadSetting()
// ----------------------------------------------------------------------

function LoadSetting()
{
   local string TypeString;
   local int typeIndex;
   
   TypeString = player.GetDefaultURL("Class");

   for (typeIndex = 0; typeIndex < arrayCount(ClassNames); typeIndex++)
   {
      if (TypeString==GetModuleName(typeIndex))
         SetValue(typeIndex);
   }
   UpdatePortrait();
}

// ----------------------------------------------------------------------
// ResetToDefault
// ----------------------------------------------------------------------

function ResetToDefault()
{   
   player.UpdateURL("Class", GetModuleName(defaultValue), true);
   player.SaveConfig();
   LoadSetting();
}

// ----------------------------------------------------------------------
// GetModuleName()
// For command line parsing
// ----------------------------------------------------------------------

function string GetModuleName(int ClassIndex)
{
   return (ClassClasses[ClassIndex]);
}

// ----------------------------------------------------------------------
// CreatePortraitButton()
// ----------------------------------------------------------------------

function CreatePortraitButton()
{
	btnPortrait = ButtonWindow(NewChild(Class'ButtonWindow'));

	btnPortrait.SetSize(116, 163);
	btnPortrait.SetPos(19, 27);

	btnPortrait.SetBackgroundStyle(DSTY_Masked);
}

// ----------------------------------------------------------------------
// UpdatePortrait()
//  Modified.  In the future I may have an optional texture package to go
//   with Shifter which will contain icons for all the new models I've
//   added.  If so, this will load them if present
// ----------------------------------------------------------------------

function UpdatePortrait()
{
   local Texture portTex;

   portTex = Texture(DynamicLoadObject(texPortraits[CurrentValue], class'Texture', True));

   if(portTex == None)
	portTex = Texture'DeusExUI.UserInterface.menuplayersetupautoteam';

   btnPortrait.SetBackground(portTex);
}

// ----------------------------------------------------------------------
// ----------------------------------------------------------------------

defaultproperties
{
     ClassClasses(0)="DeusEx.JCDentonMale"
     ClassClasses(1)="DeusEx.MPNSF"
     ClassClasses(2)="DeusEx.MPUnatco"
     ClassClasses(3)="DeusEx.MPMJ12"
     ClassClasses(4)="DeusEx.MPTOBATA"
     ClassClasses(5)="DeusEx.MPBARTENDER"
     ClassClasses(6)="DeusEx.MPBOATPER"
     ClassClasses(7)="DeusEx.MPBUSM1"
     ClassClasses(8)="DeusEx.MPBUSM2"
     ClassClasses(9)="DeusEx.MPBUSM3"
     ClassClasses(10)="DeusEx.MPBUSW1"
     ClassClasses(11)="DeusEx.MPBUTLER"
     ClassClasses(12)="DeusEx.MPSAMCAR"
     ClassClasses(13)="DeusEx.MPCHEF"
     ClassClasses(14)="DeusEx.MPMAXCHE"
     ClassClasses(15)="DeusEx.MPCHILD"
     ClassClasses(16)="DeusEx.MPCHILD2"
     ClassClasses(17)="DeusEx.MPHKMIL"
     ClassClasses(18)="DeusEx.MPMAGCHO"
     ClassClasses(19)="DeusEx.MPPAUL"
     ClassClasses(20)="DeusEx.MPDOC"
     ClassClasses(21)="DeusEx.MPSTADOW"
     ClassClasses(22)="DeusEx.MPNICOLE"
     ClassClasses(23)="DeusEx.MPCHAD"
     ClassClasses(24)="DeusEx.MPMOREVE"
     ClassClasses(25)="DeusEx.MPFEM1"
     ClassClasses(26)="DeusEx.MPFEM2"
     ClassClasses(27)="DeusEx.MPFEM3"
     ClassClasses(28)="DeusEx.MPFEM4"
     ClassClasses(29)="DeusEx.MPBUMFEM"
     ClassClasses(30)="DeusEx.MPJUNKFEM"
     ClassClasses(31)="DeusEx.MPSCIFEM"
     ClassClasses(32)="DeusEx.MPHARLEY"
     ClassClasses(33)="DeusEx.MPJOJO"
     ClassClasses(34)="DeusEx.MPJOEGRE"
     ClassClasses(35)="DeusEx.MPMICHAM"
     ClassClasses(36)="DeusEx.MPGUNTHER"
     ClassClasses(37)="DeusEx.MPHOOKER1"
     ClassClasses(38)="DeusEx.MPHOOKER2"
     ClassClasses(39)="DeusEx.MPALEX"
     ClassClasses(40)="DeusEx.MPJANITOR"
     ClassClasses(41)="DeusEx.MPJOCK"
     ClassClasses(42)="DeusEx.MPJUAN"
     ClassClasses(43)="DeusEx.MPTLP"
     ClassClasses(44)="DeusEx.MPTLP2"
     ClassClasses(45)="DeusEx.MPNATMAD"
     ClassClasses(46)="DeusEx.MPMAID"
     ClassClasses(47)="DeusEx.MPMALE1"
     ClassClasses(48)="DeusEx.MPMALE2"
     ClassClasses(49)="DeusEx.MPMALE3"
     ClassClasses(50)="DeusEx.MPMALE4"
     ClassClasses(51)="DeusEx.MPBUMMALE"
     ClassClasses(52)="DeusEx.MPBUMMALE2"
     ClassClasses(53)="DeusEx.MPBUMMALE3"
     ClassClasses(54)="DeusEx.MPJUNKMAL"
     ClassClasses(55)="DeusEx.MPSCIMAL"
     ClassClasses(56)="DeusEx.MPTHUGM"
     ClassClasses(57)="DeusEx.MPTHUGM2"
     ClassClasses(58)="DeusEx.MPTHUGM3"
     ClassClasses(59)="DeusEx.MPMIB"
     ClassClasses(60)="DeusEx.MPJOSMAN"
     ClassClasses(61)="DeusEx.MPMJ12COM"
     ClassClasses(62)="DeusEx.MPPMEAD"
     ClassClasses(63)="DeusEx.MPRMEAD"
     ClassClasses(64)="DeusEx.MPSMEAD"
     ClassClasses(65)="DeusEx.MPMECH"
     ClassClasses(66)="DeusEx.MPANNA"
     ClassClasses(67)="DeusEx.MPNURSE"
     ClassClasses(68)="DeusEx.MPBOB"
     ClassClasses(69)="DeusEx.MPCOP"
     ClassClasses(70)="DeusEx.MPLCMALE"
     ClassClasses(71)="DeusEx.MPLCMALE2"
     ClassClasses(72)="DeusEx.MPLCFEM"
     ClassClasses(73)="DeusEx.MPGORQUI"
     ClassClasses(74)="DeusEx.MPTRA"
     ClassClasses(75)="DeusEx.MPGILREN"
     ClassClasses(76)="DeusEx.MPSANREN"
     ClassClasses(77)="DeusEx.MPJAIME"
     ClassClasses(78)="DeusEx.MPRIOTCOP"
     ClassClasses(79)="DeusEx.MPGARY"
     ClassClasses(80)="DeusEx.MPTIFSAV"
     ClassClasses(81)="DeusEx.MPSAILOR"
     ClassClasses(82)="DeusEx.MPFORD"
     ClassClasses(83)="DeusEx.MPSCUBA"
     ClassClasses(84)="DeusEx.MPSECSER"
     ClassClasses(85)="DeusEx.MPSECRETARY"
     ClassClasses(86)="DeusEx.MPJORSHE"
     ClassClasses(87)="DeusEx.MPWALTON"
     ClassClasses(88)="DeusEx.MPSMUG"
     ClassClasses(89)="DeusEx.MPSOLDIER"
     ClassClasses(90)="DeusEx.MPHOWSTR"
     ClassClasses(91)="DeusEx.MPTRATONG"
     ClassClasses(92)="DeusEx.MPMARWIL"
     ClassClasses(93)="DeusEx.MPWIB"
     ClassNames(0)="JC Denton"
     ClassNames(1)="NSF Terrorist"
     ClassNames(2)="UNATCO Trooper"
     ClassNames(3)="Majestic-12 Agent"
     ClassNames(4)="Toby Atanwe"
     ClassNames(5)="Bartender"
     ClassNames(6)="Boat Person"
     ClassNames(7)="Businessman (1)"
     ClassNames(8)="Businessman (2)"
     ClassNames(9)="Businessman (3)"
     ClassNames(10)="Businesswoman"
     ClassNames(11)="Butler"
     ClassNames(12)="Sam Carter"
     ClassNames(13)="Chef"
     ClassNames(14)="Max Chen"
     ClassNames(15)="Child (1)"
     ClassNames(16)="Child (2)"
     ClassNames(17)="Chinese Military"
     ClassNames(18)="Maggie Chow"
     ClassNames(19)="Paul Denton"
     ClassNames(20)="Doctor"
     ClassNames(21)="Stanton Dowd"
     ClassNames(22)="Nicolette DuClare"
     ClassNames(23)="Chad Dumier"
     ClassNames(24)="Morgan Everett"
     ClassNames(25)="Female (1)"
     ClassNames(26)="Female (2)"
     ClassNames(27)="Female (3)"
     ClassNames(28)="Female (4)"
     ClassNames(29)="Female Bum"
     ClassNames(30)="Female Junkie"
     ClassNames(31)="Female Scientist"
     ClassNames(32)="Harley Filben"
     ClassNames(33)="Jojo Fine"
     ClassNames(34)="Joe Greene"
     ClassNames(35)="Michael Hamner"
     ClassNames(36)="Gunther Hermann"
     ClassNames(37)="Hooker (1)"
     ClassNames(38)="Hooker (2)"
     ClassNames(39)="Alex Jacobson"
     ClassNames(40)="Janitor"
     ClassNames(41)="Jock"
     ClassNames(42)="Juan Lebedev"
     ClassNames(43)="Luminous Path (1)"
     ClassNames(44)="Luminous Path (2)"
     ClassNames(45)="Nathan Madison"
     ClassNames(46)="Maid"
     ClassNames(47)="Male (1)"
     ClassNames(48)="Male (2)"
     ClassNames(49)="Male (3)"
     ClassNames(50)="Male (4)"
     ClassNames(51)="Male Bum (1)"
     ClassNames(52)="Male Bum (2)"
     ClassNames(53)="Male Bum (3)"
     ClassNames(54)="Male Junkie"
     ClassNames(55)="Male Scientist"
     ClassNames(56)="Male Thug (1)"
     ClassNames(57)="Male Thug (2)"
     ClassNames(58)="Male Thug (3)"
     ClassNames(59)="Man In Black"
     ClassNames(60)="Joseph Manderley"
     ClassNames(61)="Majestic-12 Commando"
     ClassNames(62)="Philip Mead"
     ClassNames(63)="Rachel Mead"
     ClassNames(64)="Sarah Mead"
     ClassNames(65)="Mechanic"
     ClassNames(66)="Anna Navarre"
     ClassNames(67)="Nurse"
     ClassNames(68)="Bob Page"
     ClassNames(69)="Police Officer"
     ClassNames(70)="Poor Man (1)"
     ClassNames(71)="Poor Man (2)"
     ClassNames(72)="Poor Woman"
     ClassNames(73)="Gordon Quick"
     ClassNames(74)="Red Arrow"
     ClassNames(75)="Gilbert Renton"
     ClassNames(76)="Sandra Renton"
     ClassNames(77)="Jaime Reyes"
     ClassNames(78)="Riot Cop"
     ClassNames(79)="Gary Savage"
     ClassNames(80)="Tiffany Savage"
     ClassNames(81)="Sailor"
     ClassNames(82)="Ford Schick"
     ClassNames(83)="Scuba Diver"
     ClassNames(84)="Secret Service"
     ClassNames(85)="Secretary"
     ClassNames(86)="Jordan Shea"
     ClassNames(87)="Walton Simons"
     ClassNames(88)="Smuggler"
     ClassNames(89)="Soldier"
     ClassNames(90)="Howard Strong"
     ClassNames(91)="Tracer Tong"
     ClassNames(92)="Margaret Williams"
     ClassNames(93)="Woman In Black"
     texPortraits(0)="DeusExUI.UserInterface.menuplayersetupjcdenton"
     texPortraits(1)="DeusExUI.UserInterface.menuplayersetupnsf"
     texPortraits(2)="DeusExUI.UserInterface.menuplayersetupunatco"
     texPortraits(3)="DeusExUI.UserInterface.menuplayersetupmj12"
     texPortraits(4)="DeusExUI.UserInterface.menuplayersetupautoteam"
     texPortraits(5)="DeusExUI.UserInterface.menuplayersetupautoteam"
     texPortraits(6)="DeusExUI.UserInterface.menuplayersetupautoteam"
     texPortraits(7)="DeusExUI.UserInterface.menuplayersetupautoteam"
     texPortraits(8)="DeusExUI.UserInterface.menuplayersetupautoteam"
     texPortraits(9)="DeusExUI.UserInterface.menuplayersetupautoteam"
     texPortraits(10)="DeusExUI.UserInterface.menuplayersetupautoteam"
     texPortraits(11)="DeusExUI.UserInterface.menuplayersetupautoteam"
     texPortraits(12)="DeusExUI.UserInterface.menuplayersetupautoteam"
     texPortraits(13)="DeusExUI.UserInterface.menuplayersetupautoteam"
     texPortraits(14)="DeusExUI.UserInterface.menuplayersetupautoteam"
     texPortraits(15)="DeusExUI.UserInterface.menuplayersetupautoteam"
     texPortraits(16)="DeusExUI.UserInterface.menuplayersetupautoteam"
     texPortraits(17)="DeusExUI.UserInterface.menuplayersetupautoteam"
     texPortraits(18)="DeusExUI.UserInterface.menuplayersetupautoteam"
     texPortraits(19)="DeusExUI.UserInterface.menuplayersetupautoteam"
     texPortraits(20)="DeusExUI.UserInterface.menuplayersetupautoteam"
     texPortraits(21)="DeusExUI.UserInterface.menuplayersetupautoteam"
     texPortraits(22)="DeusExUI.UserInterface.menuplayersetupautoteam"
     texPortraits(23)="DeusExUI.UserInterface.menuplayersetupautoteam"
     texPortraits(24)="DeusExUI.UserInterface.menuplayersetupautoteam"
     texPortraits(25)="DeusExUI.UserInterface.menuplayersetupautoteam"
     texPortraits(26)="DeusExUI.UserInterface.menuplayersetupautoteam"
     texPortraits(27)="DeusExUI.UserInterface.menuplayersetupautoteam"
     texPortraits(28)="DeusExUI.UserInterface.menuplayersetupautoteam"
     texPortraits(29)="DeusExUI.UserInterface.menuplayersetupautoteam"
     texPortraits(30)="DeusExUI.UserInterface.menuplayersetupautoteam"
     texPortraits(31)="DeusExUI.UserInterface.menuplayersetupautoteam"
     texPortraits(32)="DeusExUI.UserInterface.menuplayersetupautoteam"
     texPortraits(33)="DeusExUI.UserInterface.menuplayersetupautoteam"
     texPortraits(34)="DeusExUI.UserInterface.menuplayersetupautoteam"
     texPortraits(35)="DeusExUI.UserInterface.menuplayersetupautoteam"
     texPortraits(36)="DeusExUI.UserInterface.menuplayersetupautoteam"
     texPortraits(37)="DeusExUI.UserInterface.menuplayersetupautoteam"
     texPortraits(38)="DeusExUI.UserInterface.menuplayersetupautoteam"
     texPortraits(39)="DeusExUI.UserInterface.menuplayersetupautoteam"
     texPortraits(40)="DeusExUI.UserInterface.menuplayersetupautoteam"
     texPortraits(41)="DeusExUI.UserInterface.menuplayersetupautoteam"
     texPortraits(42)="DeusExUI.UserInterface.menuplayersetupautoteam"
     texPortraits(43)="DeusExUI.UserInterface.menuplayersetupautoteam"
     texPortraits(44)="DeusExUI.UserInterface.menuplayersetupautoteam"
     texPortraits(45)="DeusExUI.UserInterface.menuplayersetupautoteam"
     texPortraits(46)="DeusExUI.UserInterface.menuplayersetupautoteam"
     texPortraits(47)="DeusExUI.UserInterface.menuplayersetupautoteam"
     texPortraits(48)="DeusExUI.UserInterface.menuplayersetupautoteam"
     texPortraits(49)="DeusExUI.UserInterface.menuplayersetupautoteam"
     texPortraits(50)="DeusExUI.UserInterface.menuplayersetupautoteam"
     texPortraits(51)="DeusExUI.UserInterface.menuplayersetupautoteam"
     texPortraits(52)="DeusExUI.UserInterface.menuplayersetupautoteam"
     texPortraits(53)="DeusExUI.UserInterface.menuplayersetupautoteam"
     texPortraits(54)="DeusExUI.UserInterface.menuplayersetupautoteam"
     texPortraits(55)="DeusExUI.UserInterface.menuplayersetupautoteam"
     texPortraits(56)="DeusExUI.UserInterface.menuplayersetupautoteam"
     texPortraits(57)="DeusExUI.UserInterface.menuplayersetupautoteam"
     texPortraits(58)="DeusExUI.UserInterface.menuplayersetupautoteam"
     texPortraits(59)="DeusExUI.UserInterface.menuplayersetupautoteam"
     texPortraits(60)="DeusExUI.UserInterface.menuplayersetupautoteam"
     texPortraits(61)="DeusExUI.UserInterface.menuplayersetupautoteam"
     texPortraits(62)="DeusExUI.UserInterface.menuplayersetupautoteam"
     texPortraits(63)="DeusExUI.UserInterface.menuplayersetupautoteam"
     texPortraits(64)="DeusExUI.UserInterface.menuplayersetupautoteam"
     texPortraits(65)="DeusExUI.UserInterface.menuplayersetupautoteam"
     texPortraits(66)="DeusExUI.UserInterface.menuplayersetupautoteam"
     texPortraits(67)="DeusExUI.UserInterface.menuplayersetupautoteam"
     texPortraits(68)="DeusExUI.UserInterface.menuplayersetupautoteam"
     texPortraits(69)="DeusExUI.UserInterface.menuplayersetupautoteam"
     texPortraits(70)="DeusExUI.UserInterface.menuplayersetupautoteam"
     texPortraits(71)="DeusExUI.UserInterface.menuplayersetupautoteam"
     texPortraits(72)="DeusExUI.UserInterface.menuplayersetupautoteam"
     texPortraits(73)="DeusExUI.UserInterface.menuplayersetupautoteam"
     texPortraits(74)="DeusExUI.UserInterface.menuplayersetupautoteam"
     texPortraits(75)="DeusExUI.UserInterface.menuplayersetupautoteam"
     texPortraits(76)="DeusExUI.UserInterface.menuplayersetupautoteam"
     texPortraits(77)="DeusExUI.UserInterface.menuplayersetupautoteam"
     texPortraits(78)="DeusExUI.UserInterface.menuplayersetupautoteam"
     texPortraits(79)="DeusExUI.UserInterface.menuplayersetupautoteam"
     texPortraits(80)="DeusExUI.UserInterface.menuplayersetupautoteam"
     texPortraits(81)="DeusExUI.UserInterface.menuplayersetupautoteam"
     texPortraits(82)="DeusExUI.UserInterface.menuplayersetupautoteam"
     texPortraits(83)="DeusExUI.UserInterface.menuplayersetupautoteam"
     texPortraits(84)="DeusExUI.UserInterface.menuplayersetupautoteam"
     texPortraits(85)="DeusExUI.UserInterface.menuplayersetupautoteam"
     texPortraits(86)="DeusExUI.UserInterface.menuplayersetupautoteam"
     texPortraits(87)="DeusExUI.UserInterface.menuplayersetupautoteam"
     texPortraits(88)="DeusExUI.UserInterface.menuplayersetupautoteam"
     texPortraits(89)="DeusExUI.UserInterface.menuplayersetupautoteam"
     texPortraits(90)="DeusExUI.UserInterface.menuplayersetupautoteam"
     texPortraits(91)="DeusExUI.UserInterface.menuplayersetupautoteam"
     texPortraits(92)="DeusExUI.UserInterface.menuplayersetupautoteam"
     texPortraits(93)="DeusExUI.UserInterface.menuplayersetupautoteam"
     defaultInfoWidth=153
     defaultInfoPosX=170
     HelpText="Model for your character in non-team games."
     actionText="Non-Team Model"
}