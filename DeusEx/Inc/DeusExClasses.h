/*===========================================================================
    C++ class definitions exported from UnrealScript.
    This is automatically generated by the tools.
    DO NOT modify this manually! Edit the corresponding .uc files instead!
===========================================================================*/
#if _MSC_VER
#pragma pack (push,4)
#endif

#ifndef DEUSEX_API
#define DEUSEX_API DLL_IMPORT
#endif

#ifndef NAMES_ONLY
#define AUTOGENERATE_NAME(name) extern DEUSEX_API FName DEUSEX_##name;
#define AUTOGENERATE_FUNCTION(cls,idx,name)
#endif

AUTOGENERATE_NAME(JoltView)

#ifndef NAMES_ONLY

enum EMusicMode
{
    MUS_Ambient             =0,
    MUS_Combat              =1,
    MUS_Conversation        =2,
    MUS_Outro               =3,
    MUS_Dying               =4,
    MUS_MAX                 =5,
};
enum EInvokeMethod
{
    IM_Bump                 =0,
    IM_Frob                 =1,
    IM_Sight                =2,
    IM_Radius               =3,
    IM_Named                =4,
    IM_Other                =5,
    IM_MAX                  =6,
};
enum EShieldStatus
{
    SS_Off                  =0,
    SS_Fade                 =1,
    SS_Strong               =2,
    SS_MAX                  =3,
};
#define UCONST_NintendoDelay 6.0
#define UCONST_MPMSG_TeamHackTurret 16
#define UCONST_MPMSG_NoCloakWeapon 15
#define UCONST_MPMSG_TeamComputer 14
#define UCONST_MPMSG_TeamLAM 13
#define UCONST_MPMSG_KilledTeammate 12
#define UCONST_MPMSG_DropItem 11
#define UCONST_MPMSG_LostLegs 10
#define UCONST_MPMSG_TimeNearEnd 9
#define UCONST_MPMSG_CloseKills 8
#define UCONST_MPMSG_CameraInv 7
#define UCONST_MPMSG_TurretInv 6
#define UCONST_MPMSG_FirstBurn 5
#define UCONST_MPMSG_FirstPoison 4
#define UCONST_MPMSG_TeamSpot 3
#define UCONST_MPMSG_TeamHit 2
#define UCONST_MPMSG_TeamNsf 1
#define UCONST_MPMSG_TeamUnatco 0
#define UCONST_mpMsgDelay 4.0
#define UCONST_MPSERVERFLAG_NoCloakWeapon 0x40
#define UCONST_MPSERVERFLAG_DropItem 0x20
#define UCONST_MPSERVERFLAG_LostLegs 0x10
#define UCONST_MPSERVERFLAG_CameraInv 0x08
#define UCONST_MPSERVERFLAG_TurretInv 0x04
#define UCONST_MPSERVERFLAG_FirstBurn 0x02
#define UCONST_MPSERVERFLAG_FirstPoison 0x01
#define UCONST_MPFLAG_FirstSpot 0x01

struct ADeusExPlayer_eventJoltView_Parms
{
    FLOAT newJoltMagnitude;
};
class DEUSEX_API ADeusExPlayer : public APlayerPawnExt
{
public:
    FStringNoInit TruePlayerName;
    INT PlayerSkin;
    FLOAT CombatDifficulty;
    class AAugmentationManager* AugmentationSystem;
    class ASkillManager* SkillSystem;
    INT SkillPointsTotal;
    INT SkillPointsAvail;
    INT Credits;
    FLOAT Energy;
    FLOAT EnergyMax;
    FLOAT EnergyDrain;
    FLOAT EnergyDrainTotal;
    FLOAT MaxRegenPoint;
    FLOAT RegenRate;
    class ANanoKeyRing* KeyRing;
    class UNanoKeyInfo* KeyList;
    FLOAT MaxFrobDistance;
    class AActor* FrobTarget;
    FLOAT FrobTime;
    FLOAT LastRefreshTime;
    class AConPlay* ConPlay;
    class ADataLinkPlay* DataLinkPlay;
    class UConHistory* ConHistory;
    BYTE invSlots[30];
    INT maxInvRows;
    INT maxInvCols;
    class AInventory* inHand;
    class AInventory* inHandPending;
    class AInventory* ClientinHandPending;
    class AInventory* LastinHand;
    BITFIELD bInHandTransition:1 GCC_PACK(4);
    BITFIELD bBeltIsMPInventory:1;
    class UDeusExGoal* FirstGoal GCC_PACK(4);
    class UDeusExGoal* LastGoal;
    class UDeusExNote* FirstNote;
    class UDeusExNote* LastNote;
    class ADataVaultImage* FirstImage;
    class UDeusExLog* FirstLog;
    class UDeusExLog* LastLog;
    class AActor* ViewModelActor[8];
    BITFIELD bFirstOptionsSynced:1 GCC_PACK(4);
    BITFIELD bSecondOptionsSynced:1;
    BITFIELD bForceDuck:1;
    BITFIELD bCrouchOn:1;
    BITFIELD bWasCrouchOn:1;
    BYTE lastbDuck GCC_PACK(4);
    BITFIELD bCanLean:1 GCC_PACK(4);
    FLOAT curLeanDist GCC_PACK(4);
    FLOAT prevLeanDist;
    BITFIELD bToggleWalk:1 GCC_PACK(4);
    FLOAT RunSilentValue GCC_PACK(4);
    BITFIELD bWarrenEMPField:1 GCC_PACK(4);
    FLOAT WarrenTimer GCC_PACK(4);
    INT WarrenSlot;
    FName FloorMaterial;
    FName WallMaterial;
    FVector WallNormal;
    FLOAT drugEffectTimer;
    FLOAT JoltMagnitude;
    FLOAT poisonTimer;
    INT poisonCounter;
    INT poisonDamage;
    FLOAT BleedRate;
    FLOAT DropCounter;
    FLOAT ClotPeriod;
    FLOAT FlashTimer;
    FLOAT swimDuration;
    FLOAT swimTimer;
    FLOAT swimBubbleTimer;
    class AActor* ConversationActor;
    class AActor* lastThirdPersonConvoActor;
    FLOAT lastThirdPersonConvoTime;
    class AActor* lastFirstPersonConvoActor;
    FLOAT lastFirstPersonConvoTime;
    BITFIELD bStartingNewGame:1 GCC_PACK(4);
    BITFIELD bSavingSkillsAugs:1;
    BITFIELD bSpyDroneActive:1;
    INT spyDroneLevel GCC_PACK(4);
    FLOAT spyDroneLevelValue;
    class ASpyDrone* aDrone;
    BITFIELD bBuySkills:1 GCC_PACK(4);
    BITFIELD bKillerProfile:1;
    INT mpMsgFlags GCC_PACK(4);
    INT mpMsgServerFlags;
    INT mpMsgCode;
    FLOAT mpMsgTime;
    INT mpMsgOptionalParam;
    FStringNoInit mpMsgOptionalString;
    FStringNoInit strStartMap;
    BITFIELD bStartNewGameAfterIntro:1 GCC_PACK(4);
    BITFIELD bIgnoreNextShowMenu:1;
    FStringNoInit NextMap GCC_PACK(4);
    BITFIELD bObjectNames:1 GCC_PACK(4);
    BITFIELD bNPCHighlighting:1;
    BITFIELD bSubtitles:1;
    BITFIELD bAlwaysRun:1;
    BITFIELD bToggleCrouch:1;
    FLOAT logTimeout GCC_PACK(4);
    BYTE maxLogLines;
    BITFIELD bHelpMessages:1 GCC_PACK(4);
    BYTE translucencyLevel GCC_PACK(4);
    BITFIELD bObjectBeltVisible:1 GCC_PACK(4);
    BITFIELD bHitDisplayVisible:1;
    BITFIELD bAmmoDisplayVisible:1;
    BITFIELD bAugDisplayVisible:1;
    BITFIELD bDisplayAmmoByClip:1;
    BITFIELD bCompassVisible:1;
    BITFIELD bCrosshairVisible:1;
    BITFIELD bAutoReload:1;
    BITFIELD bDisplayAllGoals:1;
    BITFIELD bHUDShowAllAugs:1;
    INT UIBackground GCC_PACK(4);
    BITFIELD bDisplayCompletedGoals:1 GCC_PACK(4);
    BITFIELD bShowAmmoDescriptions:1;
    BITFIELD bConfirmSaveDeletes:1;
    BITFIELD bConfirmNoteDeletes:1;
    BITFIELD bAskedToTrain:1;
    FName AugPrefs[9] GCC_PACK(4);
    class ABarkManager* BarkManager;
    class AColorThemeManager* ThemeManager;
    FStringNoInit MenuThemeName;
    FStringNoInit HUDThemeName;
    BITFIELD bHUDBordersVisible:1 GCC_PACK(4);
    BITFIELD bHUDBordersTranslucent:1;
    BITFIELD bHUDBackgroundTranslucent:1;
    BITFIELD bMenusTranslucent:1;
    FStringNoInit InventoryFull GCC_PACK(4);
    FStringNoInit TooMuchAmmo;
    FStringNoInit TooHeavyToLift;
    FStringNoInit CannotLift;
    FStringNoInit NoRoomToLift;
    FStringNoInit CanCarryOnlyOne;
    FStringNoInit CannotDropHere;
    FStringNoInit HandsFull;
    FStringNoInit NoteAdded;
    FStringNoInit GoalAdded;
    FStringNoInit PrimaryGoalCompleted;
    FStringNoInit SecondaryGoalCompleted;
    FStringNoInit EnergyDepleted;
    FStringNoInit AddedNanoKey;
    FStringNoInit HealedPointsLabel;
    FStringNoInit HealedPointLabel;
    FStringNoInit SkillPointsAward;
    FStringNoInit QuickSaveGameTitle;
    FStringNoInit WeaponUnCloak;
    FStringNoInit TakenOverString;
    FStringNoInit HeadString;
    FStringNoInit TorsoString;
    FStringNoInit LegsString;
    FStringNoInit WithTheString;
    FStringNoInit WithString;
    FStringNoInit PoisonString;
    FStringNoInit BurnString;
    FStringNoInit NoneString;
    class Ashieldeffect* DamageShield;
    FLOAT ShieldTimer;
    BYTE ShieldStatus;
    class APawn* myBurner;
    class APawn* myPoisoner;
    class AActor* myProjKiller;
    class AActor* myTurretKiller;
    class AActor* myKiller;
    class AKillerProfile* killProfile;
    class AInvulnSphere* invulnSph;
    BYTE musicMode;
    BYTE savedSection;
    FLOAT musicCheckTimer;
    FLOAT musicChangeTimer;
    INT saveCount;
    FLOAT saveTime;
    class UDebugInfo* GlobalDebugObj;
    BITFIELD bQuotesEnabled:1 GCC_PACK(4);
    class AGameInfo* DXGame GCC_PACK(4);
    FLOAT ServerTimeDiff;
    FLOAT ServerTimeLastRefresh;
    FLOAT MPDamageMult;
    FLOAT NintendoImmunityTime;
    FLOAT NintendoImmunityTimeLeft;
    BITFIELD bNintendoImmunity:1 GCC_PACK(4);
    class AComputers* ActiveComputer GCC_PACK(4);
    DECLARE_FUNCTION(execUnloadTexture);
    DECLARE_FUNCTION(execCreateDumpLocationObject);
    DECLARE_FUNCTION(execCreateDataVaultImageNoteObject);
    DECLARE_FUNCTION(execCreateGameDirectoryObject);
    DECLARE_FUNCTION(execDeleteSaveGameFiles);
    DECLARE_FUNCTION(execSaveGame);
    DECLARE_FUNCTION(execCreateLogObject);
    DECLARE_FUNCTION(execCreateHistoryEvent);
    DECLARE_FUNCTION(execCreateHistoryObject);
    DECLARE_FUNCTION(execSetBoolFlagFromString);
    DECLARE_FUNCTION(execConBindEvents);
    DECLARE_FUNCTION(execGetDeusExVersion);
    void eventJoltView(FLOAT newJoltMagnitude)
    {
        ADeusExPlayer_eventJoltView_Parms Parms;
        Parms.newJoltMagnitude=newJoltMagnitude;
        ProcessEvent(FindFunctionChecked(DEUSEX_JoltView),&Parms);
    }
    DECLARE_CLASS(ADeusExPlayer,APlayerPawnExt,0|CLASS_Config)
    NO_DEFAULT_CONSTRUCTOR(ADeusExPlayer)
};

enum ETurning
{
    TURNING_None            =0,
    TURNING_Left            =1,
    TURNING_Right           =2,
    TURNING_MAX             =3,
};
enum EHitLocation
{
    HITLOC_None             =0,
    HITLOC_HeadFront        =1,
    HITLOC_HeadBack         =2,
    HITLOC_TorsoFront       =3,
    HITLOC_TorsoBack        =4,
    HITLOC_LeftLegFront     =5,
    HITLOC_LeftLegBack      =6,
    HITLOC_RightLegFront    =7,
    HITLOC_RightLegBack     =8,
    HITLOC_LeftArmFront     =9,
    HITLOC_LeftArmBack      =10,
    HITLOC_RightArmFront    =11,
    HITLOC_RightArmBack     =12,
    HITLOC_MAX              =13,
};
enum ESeekType
{
    SEEKTYPE_None           =0,
    SEEKTYPE_Sound          =1,
    SEEKTYPE_Sight          =2,
    SEEKTYPE_Guess          =3,
    SEEKTYPE_Carcass        =4,
    SEEKTYPE_MAX            =5,
};
enum ERaiseAlarmType
{
    RAISEALARM_BeforeAttacking=0,
    RAISEALARM_BeforeFleeing=1,
    RAISEALARM_Never        =2,
    RAISEALARM_MAX          =3,
};
enum EAllianceType
{
    ALLIANCE_Friendly       =0,
    ALLIANCE_Neutral        =1,
    ALLIANCE_Hostile        =2,
    ALLIANCE_MAX            =3,
};
enum EDestinationType
{
    DEST_Failure            =0,
    DEST_NewLocation        =1,
    DEST_SameLocation       =2,
    DEST_MAX                =3,
};

class DEUSEX_API AScriptedPawn : public APawn
{
public:
    class AWanderPoint* lastPoints[2];
    FLOAT Restlessness;
    FLOAT Wanderlust;
    FLOAT Cowardice;
    FLOAT BaseAccuracy;
    FLOAT maxRange;
    FLOAT MinRange;
    FLOAT MinHealth;
    FLOAT RandomWandering;
    FLOAT sleepTime;
    class AActor* destPoint;
    FVector destLoc;
    FVector useLoc;
    FRotator useRot;
    FLOAT seekDistance;
    INT SeekLevel;
    BYTE SeekType;
    class APawn* SeekPawn;
    FLOAT CarcassTimer;
    FLOAT CarcassHateTimer;
    FLOAT CarcassCheckTimer;
    FName PotentialEnemyAlliance;
    FLOAT PotentialEnemyTimer;
    FLOAT BeamCheckTimer;
    BITFIELD bSeekPostCombat:1 GCC_PACK(4);
    BITFIELD bSeekLocation:1;
    BITFIELD bInterruptSeek:1;
    BITFIELD bAlliancesChanged:1;
    BITFIELD bNoNegativeAlliances:1;
    BITFIELD bSitAnywhere:1;
    BITFIELD bSitInterpolation:1;
    BITFIELD bStandInterpolation:1;
    FLOAT remainingSitTime GCC_PACK(4);
    FLOAT remainingStandTime;
    FVector StandRate;
    FLOAT ReloadTimer;
    BITFIELD bReadyToReload:1 GCC_PACK(4);
    class UClass* CarcassType GCC_PACK(4);
    FName Orders;
    FName OrderTag;
    FName HomeTag;
    FLOAT HomeExtent;
    class AActor* OrderActor;
    FName NextAnim;
    FLOAT WalkingSpeed;
    FLOAT ProjectileSpeed;
    FName LastPainAnim;
    FLOAT LastPainTime;
    FVector DesiredPrePivot;
    FLOAT PrePivotTime;
    FVector PrePivotOffset;
    BITFIELD bCanBleed:1 GCC_PACK(4);
    FLOAT BleedRate GCC_PACK(4);
    FLOAT DropCounter;
    FLOAT ClotPeriod;
    BITFIELD bAcceptBump:1 GCC_PACK(4);
    BITFIELD bCanFire:1;
    BITFIELD bKeepWeaponDrawn:1;
    BITFIELD bShowPain:1;
    BITFIELD bCanSit:1;
    BITFIELD bAlwaysPatrol:1;
    BITFIELD bPlayIdle:1;
    BITFIELD bLeaveAfterFleeing:1;
    BITFIELD bLikesNeutral:1;
    BITFIELD bUseFirstSeatOnly:1;
    BITFIELD bCower:1;
    class AHomeBase* HomeActor GCC_PACK(4);
    FVector HomeLoc;
    FVector HomeRot;
    BITFIELD bUseHome:1 GCC_PACK(4);
    BITFIELD bInterruptState:1;
    BITFIELD bCanConverse:1;
    BITFIELD bImportant:1;
    BITFIELD bInvincible:1;
    BITFIELD bInitialized:1;
    BITFIELD bNPCRandomCheck:1;
    BITFIELD bNPCRandomGiven:1;
    BITFIELD bCheckedCombat:1;
    BITFIELD bAvoidAim:1;
    BITFIELD bAimForHead:1;
    BITFIELD bDefendHome:1;
    BITFIELD bCanCrouch:1;
    BITFIELD bSeekCover:1;
    BITFIELD bSprint:1;
    BITFIELD bUseFallbackWeapons:1;
    FLOAT AvoidAccuracy GCC_PACK(4);
    BITFIELD bAvoidHarm:1 GCC_PACK(4);
    FLOAT HarmAccuracy GCC_PACK(4);
    FLOAT CrouchRate;
    FLOAT SprintRate;
    FLOAT CloseCombatMult;
    BITFIELD bHateHacking:1 GCC_PACK(4);
    BITFIELD bHateWeapon:1;
    BITFIELD bHateShot:1;
    BITFIELD bHateInjury:1;
    BITFIELD bHateIndirectInjury:1;
    BITFIELD bHateCarcass:1;
    BITFIELD bHateDistress:1;
    BITFIELD bReactFutz:1;
    BITFIELD bReactPresence:1;
    BITFIELD bReactLoudNoise:1;
    BITFIELD bReactAlarm:1;
    BITFIELD bReactShot:1;
    BITFIELD bReactCarcass:1;
    BITFIELD bReactDistress:1;
    BITFIELD bReactProjectiles:1;
    BITFIELD bFearHacking:1;
    BITFIELD bFearWeapon:1;
    BITFIELD bFearShot:1;
    BITFIELD bFearInjury:1;
    BITFIELD bFearIndirectInjury:1;
    BITFIELD bFearCarcass:1;
    BITFIELD bFearDistress:1;
    BITFIELD bFearAlarm:1;
    BITFIELD bFearProjectiles:1;
    BITFIELD bEmitDistress:1;
    BYTE RaiseAlarm GCC_PACK(4);
    BITFIELD bLookingForEnemy:1 GCC_PACK(4);
    BITFIELD bLookingForLoudNoise:1;
    BITFIELD bLookingForAlarm:1;
    BITFIELD bLookingForDistress:1;
    BITFIELD bLookingForProjectiles:1;
    BITFIELD bLookingForFutz:1;
    BITFIELD bLookingForHacking:1;
    BITFIELD bLookingForShot:1;
    BITFIELD bLookingForWeapon:1;
    BITFIELD bLookingForCarcass:1;
    BITFIELD bLookingForInjury:1;
    BITFIELD bLookingForIndirectInjury:1;
    BITFIELD bFacingTarget:1;
    BITFIELD bMustFaceTarget:1;
    FLOAT FireAngle GCC_PACK(4);
    FLOAT FireElevation;
    INT MaxProvocations;
    FLOAT AgitationSustainTime;
    FLOAT AgitationDecayRate;
    FLOAT AgitationTimer;
    FLOAT AgitationCheckTimer;
    FLOAT PlayerAgitationTimer;
    FLOAT FearSustainTime;
    FLOAT FearDecayRate;
    FLOAT FearTimer;
    FLOAT FearLevel;
    FLOAT EnemyReadiness;
    FLOAT ReactionLevel;
    FLOAT SurprisePeriod;
    FLOAT SightPercentage;
    FLOAT CycleTimer;
    FLOAT CyclePeriod;
    FLOAT CycleCumulative;
    class APawn* CycleCandidate;
    FLOAT CycleDistance;
    class AAlarmUnit* AlarmActor;
    FLOAT AlarmTimer;
    FLOAT WeaponTimer;
    FLOAT FireTimer;
    FLOAT SpecialTimer;
    FLOAT CrouchTimer;
    FLOAT BackpedalTimer;
    BITFIELD bHasShadow:1 GCC_PACK(4);
    FLOAT ShadowScale GCC_PACK(4);
    BITFIELD bDisappear:1 GCC_PACK(4);
    BITFIELD bInTransientState:1;
    FInitialAllianceInfo InitialAlliances[8] GCC_PACK(4);
    FAllianceInfoEx AlliancesEx[16];
    BITFIELD bReverseAlliances:1 GCC_PACK(4);
    FLOAT BaseAssHeight GCC_PACK(4);
    FLOAT EnemyTimeout;
    FLOAT CheckPeriod;
    FLOAT EnemyLastSeen;
    INT SeatSlot;
    class ASeat* SeatActor;
    INT cycleIndex;
    INT BodyIndex;
    BITFIELD bRunningStealthy:1 GCC_PACK(4);
    BITFIELD bPausing:1;
    BITFIELD bStaring:1;
    BITFIELD bAttacking:1;
    BITFIELD bDistressed:1;
    BITFIELD bStunned:1;
    BITFIELD bOutInOne:1;
    BITFIELD bSitting:1;
    BITFIELD bDancing:1;
    BITFIELD bCrouching:1;
    BITFIELD bCanTurnHead:1;
    BITFIELD bTickVisibleOnly:1;
    BITFIELD bInWorld:1;
    FVector WorldPosition GCC_PACK(4);
    BITFIELD bWorldCollideActors:1 GCC_PACK(4);
    BITFIELD bWorldBlockActors:1;
    BITFIELD bWorldBlockPlayers:1;
    BITFIELD bHighlight:1;
    BITFIELD bHokeyPokey:1;
    BITFIELD bConvEndState:1;
    FInventoryItem InitialInventory[8] GCC_PACK(4);
    BITFIELD bConversationEndedNormally:1 GCC_PACK(4);
    BITFIELD bInConversation:1;
    class AActor* ConversationActor GCC_PACK(4);
    class USound* WalkSound;
    FLOAT swimBubbleTimer;
    BITFIELD bSpawnBubbles:1 GCC_PACK(4);
    BITFIELD bUseSecondaryAttack:1;
    BITFIELD bWalkAround:1;
    BITFIELD bClearedObstacle:1;
    BITFIELD bEnableCheckDest:1;
    BYTE TurnDirection GCC_PACK(4);
    BYTE NextDirection;
    class AActor* ActorAvoiding;
    FLOAT AvoidWallTimer;
    FLOAT AvoidBumpTimer;
    FLOAT ObstacleTimer;
    FVector LastDestLoc;
    FVector LastDestPoint;
    INT DestAttempts;
    FLOAT DeathTimer;
    FLOAT EnemyTimer;
    FLOAT TakeHitTimer;
    FName ConvOrders;
    FName ConvOrderTag;
    FLOAT BurnPeriod;
    FLOAT FutzTimer;
    FLOAT DistressTimer;
    FVector SeatLocation;
    class ASeat* SeatHack;
    BITFIELD bSeatLocationValid:1 GCC_PACK(4);
    BITFIELD bSeatHackUsed:1;
    BITFIELD bBurnedToDeath:1;
    BITFIELD bHasCloak:1;
    BITFIELD bCloakOn:1;
    INT CloakThreshold GCC_PACK(4);
    FLOAT CloakEMPTimer;
    FLOAT poisonTimer;
    INT poisonCounter;
    INT poisonDamage;
    class APawn* poisoner;
    FName Carcasses[4];
    INT NumCarcasses;
    FLOAT walkAnimMult;
    FLOAT runAnimMult;
    BITFIELD bUnStunnable:1 GCC_PACK(4);
    BITFIELD bTookHandtoHand:1;
    BITFIELD bCanGiveWeapon:1;
    INT PendingSkillPoints GCC_PACK(4);
    FVector EnemyLastSeenAt;
    class USound* SearchingSound;
    class USound* SpeechTargetAcquired;
    class USound* SpeechTargetLost;
    class USound* SpeechOutOfAmmo;
    class USound* SpeechCriticalDamage;
    class USound* SpeechScanning;
    class USound* SpeechAreaSecure;
    DECLARE_FUNCTION(execAddCarcass);
    DECLARE_FUNCTION(execHaveSeenCarcass);
    DECLARE_FUNCTION(execGetPawnAllianceType);
    DECLARE_FUNCTION(execGetAllianceType);
    DECLARE_FUNCTION(execIsValidEnemy);
    DECLARE_FUNCTION(execConBindEvents);
    DECLARE_CLASS(AScriptedPawn,APawn,0|CLASS_Config)
    NO_DEFAULT_CONSTRUCTOR(AScriptedPawn)
};


class DEUSEX_API ADeusExLevelInfo : public AInfo
{
public:
    FStringNoInit MapName;
    FStringNoInit MapAuthor;
    FStringNoInit MissionLocation;
    INT missionNumber;
    BITFIELD bMultiPlayerMap:1 GCC_PACK(4);
    class UClass* Script GCC_PACK(4);
    INT TrueNorth;
    FStringNoInit startupMessage[4];
    FStringNoInit ConversationPackage;
    FStringNoInit emailSubject[25];
    FStringNoInit emailFrom[25];
    FStringNoInit emailTo[25];
    FStringNoInit emailCC[25];
    FStringNoInit emailString[25];
    DECLARE_CLASS(ADeusExLevelInfo,AInfo,0)
    NO_DEFAULT_CONSTRUCTOR(ADeusExLevelInfo)
};


class DEUSEX_API ADeusExDecoration : public ADecoration
{
public:
    INT HitPoints;
    INT minDamageThreshold;
    BITFIELD bInvincible:1 GCC_PACK(4);
    class UClass* FragType GCC_PACK(4);
    BITFIELD bFloating:1 GCC_PACK(4);
    FRotator origRot GCC_PACK(4);
    FName moverTag;
    BITFIELD bFlammable:1 GCC_PACK(4);
    FLOAT Flammability GCC_PACK(4);
    BITFIELD bExplosive:1 GCC_PACK(4);
    INT explosionDamage GCC_PACK(4);
    FLOAT explosionRadius;
    BITFIELD bHighlight:1 GCC_PACK(4);
    BITFIELD bCanBeBase:1;
    BITFIELD bGenerateFlies:1;
    INT pushSoundId GCC_PACK(4);
    INT gradualHurtSteps;
    INT gradualHurtCounter;
    FName NextState;
    FName NextLabel;
    class AFlyGenerator* flyGen;
    FStringNoInit ItemArticle;
    FStringNoInit ItemName;
    DECLARE_FUNCTION(execConBindEvents);
    DECLARE_CLASS(ADeusExDecoration,ADecoration,0)
    NO_DEFAULT_CONSTRUCTOR(ADeusExDecoration)
};


class DEUSEX_API ASkillManager : public AActor
{
public:
    class ADeusExPlayer* Player;
    class UClass* skillClasses[15];
    class ASkill* FirstSkill;
    FStringNoInit NoToolMessage;
    FStringNoInit NoSkillMessage;
    FStringNoInit SuccessMessage;
    FStringNoInit YourSkillLevelAt;
    DECLARE_CLASS(ASkillManager,AActor,0)
    NO_DEFAULT_CONSTRUCTOR(ASkillManager)
};


class DEUSEX_API ASkill : public AActor
{
public:
    FStringNoInit SkillName;
    FStringNoInit Description;
    class UTexture* SkillIcon;
    BITFIELD bAutomatic:1 GCC_PACK(4);
    BITFIELD bConversationBased:1;
    INT cost[3] GCC_PACK(4);
    FLOAT LevelValues[4];
    INT CurrentLevel;
    class UClass* itemNeeded;
    class ADeusExPlayer* Player;
    class ASkill* Next;
    FStringNoInit skillLevelStrings[4];
    FStringNoInit SkillAtMaximum;
    DECLARE_CLASS(ASkill,AActor,0)
    NO_DEFAULT_CONSTRUCTOR(ASkill)
};


class DEUSEX_API AAugmentationManager : public AActor
{
public:
    FS_AugInfo AugLocs[7];
    class ADeusExPlayer* Player;
    class AAugmentation* FirstAug;
    class UClass* augClasses[25];
    class UClass* defaultAugs[3];
    FStringNoInit AugLocationFull;
    FStringNoInit NoAugInSlot;
    FStringNoInit HighPowerDrain;
    DECLARE_CLASS(AAugmentationManager,AActor,0)
    NO_DEFAULT_CONSTRUCTOR(AAugmentationManager)
};

enum EAugmentationLocation
{
    LOC_Cranial             =0,
    LOC_Eye                 =1,
    LOC_Torso               =2,
    LOC_Arm                 =3,
    LOC_Leg                 =4,
    LOC_Subdermal           =5,
    LOC_Default             =6,
    LOC_MAX                 =7,
};

class DEUSEX_API AAugmentation : public AActor
{
public:
    BITFIELD bAutomatic:1 GCC_PACK(4);
    FLOAT EnergyRate GCC_PACK(4);
    INT CurrentLevel;
    INT MaxLevel;
    class UTexture* Icon;
    INT IconWidth;
    INT IconHeight;
    class UTexture* smallIcon;
    BITFIELD bAlwaysActive:1 GCC_PACK(4);
    BITFIELD bBoosted:1;
    INT HotKeyNum GCC_PACK(4);
    class AAugmentation* Next;
    BITFIELD bUsingMedbot:1 GCC_PACK(4);
    FStringNoInit EnergyRateLabel GCC_PACK(4);
    FStringNoInit OccupiesSlotLabel;
    FStringNoInit AugLocsText[7];
    FStringNoInit AugActivated;
    FStringNoInit AugDeactivated;
    FStringNoInit AugmentationName;
    FStringNoInit Description;
    FStringNoInit MPInfo;
    FStringNoInit AugAlreadyHave;
    FStringNoInit AugNowHave;
    FStringNoInit AugNowHaveAtLevel;
    FStringNoInit AlwaysActiveLabel;
    FStringNoInit CanUpgradeLabel;
    FStringNoInit CurrentLevelLabel;
    FStringNoInit MaximumLabel;
    class ADeusExPlayer* Player;
    FLOAT LevelValues[5];
    BITFIELD bHasIt:1 GCC_PACK(4);
    BITFIELD bIsActive:1;
    BYTE AugmentationLocation GCC_PACK(4);
    INT MPConflictSlot;
    class USound* ActivateSound;
    class USound* DeActivateSound;
    class USound* LoopSound;
    DECLARE_CLASS(AAugmentation,AActor,0)
    NO_DEFAULT_CONSTRUCTOR(AAugmentation)
};


class DEUSEX_API UParticleIterator : public URenderIterator
{
public:
    FsParticle Particles[64];
    INT nextFreeParticle;
    class AActor* proxy;
    BITFIELD bOwnerUsesGravity:1 GCC_PACK(4);
    BITFIELD bOwnerScales:1;
    BITFIELD bOwnerFades:1;
    FLOAT OwnerZoneGravity GCC_PACK(4);
    FLOAT OwnerRiseRate;
    FLOAT OwnerLifeSpan;
    FLOAT OwnerDrawScale;
    DECLARE_FUNCTION(execUpdateParticles);
    DECLARE_CLASS(UParticleIterator,URenderIterator,0)
    NO_DEFAULT_CONSTRUCTOR(UParticleIterator)
};


class DEUSEX_API UDeusExSaveInfo : public UObject
{
public:
    INT Year;
    INT Month;
    INT Day;
    INT Hour;
    INT Minute;
    INT Second;
    INT DirectoryIndex;
    FStringNoInit Description;
    FStringNoInit MissionLocation;
    FStringNoInit MapName;
    class UTexture* Snapshot;
    INT saveCount;
    INT saveTime;
    BITFIELD bCheatsEnabled:1 GCC_PACK(4);
    DECLARE_FUNCTION(execUpdateTimeStamp);
    DECLARE_CLASS(UDeusExSaveInfo,UObject,0)
    NO_DEFAULT_CONSTRUCTOR(UDeusExSaveInfo)
};


class DEUSEX_API UDeusExLog : public UObject
{
public:
    FStringNoInit Text;
    class UDeusExLog* Next;
    DECLARE_CLASS(UDeusExLog,UObject,0)
    NO_DEFAULT_CONSTRUCTOR(UDeusExLog)
};


class DEUSEX_API UDataVaultImageNote : public UObject
{
public:
    FStringNoInit noteText;
    INT posX;
    INT posY;
    BITFIELD bExpanded:1 GCC_PACK(4);
    class UDataVaultImageNote* nextNote GCC_PACK(4);
    DECLARE_CLASS(UDataVaultImageNote,UObject,0)
    NO_DEFAULT_CONSTRUCTOR(UDataVaultImageNote)
};

#endif

AUTOGENERATE_FUNCTION(UParticleIterator,3017,execUpdateParticles);
AUTOGENERATE_FUNCTION(AScriptedPawn,2109,execAddCarcass);
AUTOGENERATE_FUNCTION(AScriptedPawn,2108,execHaveSeenCarcass);
AUTOGENERATE_FUNCTION(AScriptedPawn,2107,execGetPawnAllianceType);
AUTOGENERATE_FUNCTION(AScriptedPawn,2106,execGetAllianceType);
AUTOGENERATE_FUNCTION(AScriptedPawn,2105,execIsValidEnemy);
AUTOGENERATE_FUNCTION(AScriptedPawn,2102,execConBindEvents);
AUTOGENERATE_FUNCTION(UDeusExSaveInfo,3075,execUpdateTimeStamp);
AUTOGENERATE_FUNCTION(ADeusExPlayer,3016,execUnloadTexture);
AUTOGENERATE_FUNCTION(ADeusExPlayer,3015,execCreateDumpLocationObject);
AUTOGENERATE_FUNCTION(ADeusExPlayer,3014,execCreateDataVaultImageNoteObject);
AUTOGENERATE_FUNCTION(ADeusExPlayer,3013,execCreateGameDirectoryObject);
AUTOGENERATE_FUNCTION(ADeusExPlayer,3012,execDeleteSaveGameFiles);
AUTOGENERATE_FUNCTION(ADeusExPlayer,3011,execSaveGame);
AUTOGENERATE_FUNCTION(ADeusExPlayer,3010,execCreateLogObject);
AUTOGENERATE_FUNCTION(ADeusExPlayer,3003,execCreateHistoryEvent);
AUTOGENERATE_FUNCTION(ADeusExPlayer,3002,execCreateHistoryObject);
AUTOGENERATE_FUNCTION(ADeusExPlayer,3001,execSetBoolFlagFromString);
AUTOGENERATE_FUNCTION(ADeusExPlayer,2100,execConBindEvents);
AUTOGENERATE_FUNCTION(ADeusExPlayer,1099,execGetDeusExVersion);
AUTOGENERATE_FUNCTION(ADeusExDecoration,2101,execConBindEvents);

#ifndef NAMES_ONLY
#undef AUTOGENERATE_NAME
#undef AUTOGENERATE_FUNCTION
#endif NAMES_ONLY

#if _MSC_VER
#pragma pack (pop)
#endif
