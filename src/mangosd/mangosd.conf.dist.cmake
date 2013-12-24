################################################################################
# World server configuration                                                   #
################################################################################

[MangosdConf]
ConfVersion=2013012201

################################################################################
# CONNECTIONS AND DIRECTORIES
#
#    RealmID
#        RealmID must match the realmlist inside the realmd database
#
#    DataDir
#        Data directory setting.
#        Important: DataDir needs to be quoted, as it is a string which may contain space characters.
#        Example: "${CMAKE_INSTALL_PREFIX}/share/mangos"
#
#    LogsDir
#        Logs directory setting.
#        Important: Logs dir must exists, or all logs need to be disabled
#        Default: "" - no log directory prefix. if used log names aren't absolute paths
#                      then logs will be stored in the current directory of the running program.
#
#
#    LoginDatabaseInfo
#    WorldDatabaseInfo
#    CharacterDatabaseInfo
#        Database connection settings for the world server.
#        Default:
#                ---MYSQL---
#                    hostname;port;username;password;database
#                    .;somenumber;username;password;database - use named pipes at Windows
#                        Named pipes: mySQL required adding "enable-named-pipe" to [mysqld] section my.ini
#                    .;/path/to/unix_socket;username;password;database - use Unix sockets at Unix/Linux
#                ---PGSQL---
#                    hostname;port;username;password;database
#                    .;/path/to/unix_socket/DIRECTORY or . for default path;username;password;database - use Unix sockets at Unix/Linux
#
#	LoginDatabaseConnections
#	WorldDatabaseConnections
#	CharacterDatabaseConnections
#		 Amount of connections to database which will be used for SELECT queries. Maximum 16 connections per database.
#		 Please, note, for data consistency only one connection for each database is used for transactions and async SELECTs.
#		 So formula to find out how many connections will be established: X = �_connections + 1
#		 Default: 1 connection for SELECT statements
#
#    MaxPingTime
#        Settings for maximum database-ping interval (minutes between pings)
#
#    WorldServerPort
#        Port on which the server will listen
#
#    BindIP
#        Bind World Server to IP/hostname
#        This option is useful for running multiple worldd/realmd instances
#        on different IP addresses using default ports.
#        DO NOT CHANGE THIS UNLESS YOU _REALLY_ KNOW WHAT YOU'RE DOING
#
################################################################################

RealmID                      = 1
DataDir                      = "${CMAKE_INSTALL_PREFIX}/share/${APPLICATION_NAME}"
LogsDir                      = ""
LoginDatabaseInfo            = "127.0.0.1;3306;mangos;mangos;realmd"
WorldDatabaseInfo            = "127.0.0.1;3306;mangos;mangos;mangos"
CharacterDatabaseInfo        = "127.0.0.1;3306;mangos;mangos;characters"
LoginDatabaseConnections     = 1
WorldDatabaseConnections     = 1
CharacterDatabaseConnections = 1
MaxPingTime                  = 30
WorldServerPort              = 8085
BindIP                       = "0.0.0.0"

################################################################################
# PERFORMANCE SETINGS
#
#    UseProcessors
#        Used processors mask for multi-processors system (Used only at Windows)
#        Default: 0 (selected by OS)
#                 number (bitmask value of selected processors)
#
#    ProcessPriority
#        Process priority setting (Used only at Windows)
#        Default: 1 (HIGH)
#                 0 (Normal)
#
#    Compression
#        Compression level for update packages sent to client (1..9)
#        Default: 1 (speed)
#                 9 (best compression)
#
#    PlayerLimit
#        Maximum number of players in the world. Excluding Mods, GM's and Admins
#        Default: 100
#                 0 (for infinite players)
#                -1 (for Mods, GM's and Admins only)
#                -2 (for GM's and Admins only)
#                -3 (for Admins only)
#
#    SaveRespawnTimeImmediately
#        Save respawn time for creatures at death and for gameobjects at use/open
#        Default: 1 (save creature/gameobject respawn time without waiting grid unload)
#                 0 (save creature/gameobject respawn time at grid unload)
#
#    MaxOverspeedPings
#        Maximum overspeed ping count before player kick (minimum is 2, 0 used to disable check)
#        Default: 2
#
#    GridUnload
#        Unload grids (if you have lot memory you can disable it to speed up player move to new grids second time)
#        Default: 1 (unload grids)
#                 0 (do not unload grids)
#
#    GridCleanUpDelay
#        Grid clean up delay (in milliseconds)
#        Default: 300000 (5 min)
#
#    MapUpdateInterval
#        Map update interval (in milliseconds)
#        Default: 100
#
#    ChangeWeatherInterval
#        Weather update interval (in milliseconds)
#        Default: 600000 (10 min)
#
#    PlayerSave.Interval
#        Player save interval (in milliseconds)
#        Default: 900000 (15 min)
#
#    PlayerSave.Stats.MinLevel
#        Minimum level for saving character stats for external usage in database
#        Default: 0  (do not save character stats)
#                 1+ (save stats for characters with level 1+)
#
#    PlayerSave.Stats.SaveOnlyOnLogout
#        Enable/Disable saving of character stats only on logout
#        Default: 1 (only save on logout)
#                 0 (save on every player save)
#
#    vmap.enableLOS
#    vmap.enableHeight
#        Enable/Disable VMaps support for line of sight and height calculation
#        You need to extract the VMaps in order to enable those options
#        Default: 1 (enable)
#                 0 (disable)
#
#    vmap.ignoreSpellIds
#        These spells are ignored for LoS calculation
#        List of ids with delimiter ','
#
#    vmap.enableIndoorCheck
#        Enable/Disable VMap based indoor check to remove outdoor-only auras (mounts etc.).
#        Requires VMaps enabled to work.
#        Default: 1 (Enabled)
#                 0 (Disabled)
#
#
#    DetectPosCollision
#        Check final move position, summon position, etc for visible collision with other objects or
#        wall (wall only if vmaps are enabled)
#        Default: 1 (enable, requires more CPU power)
#                 0 (disable, not so nice position selection but will require less CPU power)
#
#    TargetPosRecalculateRange
#        Max distance from movement target point (+moving unit size) and targeted object (+size)
#        after that new target movement point calculated. Max: melee attack range (5), min: contact range (0.5)
#        More distance let have better performence, less distance let have more sensitive reaction at target move.
#        Default: 1.5
#
#    mmap.enabled
#        Enable/Disable pathfinding using mmaps
#        Default: 1 (enable)
#                 0 (disable)
#
#    mmap.ignoreMapIds
#        Disable mmap pathfinding on the listed maps.
#        List of map ids with delimiter ','
#
#    UpdateUptimeInterval
#        Update realm uptime period in minutes (for save data in 'uptime' table). Must be > 0
#        Default: 10 (minutes)
#
#    MaxCoreStuckTime
#        Periodically check if the process got freezed, if this is the case force crash after the specified
#        amount of seconds. Must be > 0. Recommended > 10 secs if you use this.
#        Default: 0 (Disabled)
#
#    AddonChannel
#        Permit/disable the use of the addon channel through the server
#        (some client side addons can stop work correctly with disabled addon channel)
#        Default: 1 (permit addon channel)
#                 0 (do not permit addon channel)
#
#    CleanCharacterDB
#        Perform character db cleanups on start up
#        Default: 1 (Enable)
#                 0 (Disabled)
#
################################################################################

UseProcessors                     = 0
ProcessPriority                   = 1
Compression                       = 1
PlayerLimit                       = 100
SaveRespawnTimeImmediately        = 1
MaxOverspeedPings                 = 2
GridUnload                        = 1
GridCleanUpDelay                  = 300000
MapUpdateInterval                 = 100
ChangeWeatherInterval             = 600000
PlayerSave.Interval               = 900000
PlayerSave.Stats.MinLevel         = 0
PlayerSave.Stats.SaveOnlyOnLogout = 1
vmap.enableLOS                    = 1
vmap.enableHeight                 = 1
vmap.ignoreSpellIds               = "7720"
vmap.enableIndoorCheck            = 1
DetectPosCollision                = 1
TargetPosRecalculateRange         = 1.5
mmap.enabled                      = 1
mmap.ignoreMapIds                 = ""
UpdateUptimeInterval              = 10
MaxCoreStuckTime                  = 0
AddonChannel                      = 1
CleanCharacterDB                  = 1

################################################################################
# SERVER LOGGING
#
#    LogSQL
#        Enable logging of GM commands - all SQL code will be written to a log file
#        All commands are written to a file: YYYY-MM-DD_logSQL.sql
#        If a new day starts (00:00:00), a new file is created - the old file will not be deleted.
#        Default: 1 - Write SQL code to logfile
#                 0 - Do not log
#
#    PidFile
#        World daemon PID file
#        Default: ""             - do not create PID file
#                 "./worldd.pid" - create PID file (recommended name)
#
#    LogLevel
#        Server console level of logging
#        0 = Minimum; 1 = Basic&Error; 2 = Detail; 3 = Full/Debug
#        Default: 3
#
#    LogTime
#        Include time in server console output [hh:mm:ss]
#        Default: 0 (no time)
#                 1 (print time)
#
#    LogFile
#        Logfile name
#        Default: "world-server.log"
#                 "" - Empty name disable creating log file
#
#    LogTimestamp
#        Logfile with timestamp of server start in name
#        Default: 0 - no timestamp in name
#                 1 - add timestamp in name in form Logname_YYYY-MM-DD_HH-MM-SS.Ext for Logname.Ext
#
#    LogFileLevel
#        Server file level of logging
#        0 = Minimum; 1 = Error; 2 = Detail; 3 = Full/Debug
#        Default: 0
#
#    LogFilter_CreatureMoves
#    LogFilter_TransportMoves
#    LogFilter_PlayerMoves
#    LogFilter_VisibilityChanges
#    LogFilter_Weather
#    LogFilter_DbStrictedCheck
#    LogFilter_SQLText
#    LogFilter_Pathfinding
#    LogFilter_MapsLoading
#    LogFilter_EventAiDev
#        Log filters (active by default - meaning: the filter is active, hence the log is not displayed)
#        Default: 1 - not include with any log level
#                 0 - include in log if log level permit
#
#    LogFilter_PeriodicAffects
#    LogFilter_AIAndMovegens
#    LogFilter_PlayerStats
#    LogFilter_Damage
#    LogFilter_Combat
#    LogFilter_SpellCast
#        Log filters (disabled by default, mostly debug only output affected cases)
#        Default: 0 - include in log if log level permit
#                 1 - not include with any log level
#
#    WorldLogFile
#        Packet logging file for the worldserver
#        Default: ""          - no log file created
#                 "world.log" - recommended name to create a log file
#
#    WorldLogTimestamp
#        Logfile with timestamp of server start in name
#        Default: 0 - no timestamp in name
#                 1 - add timestamp in name in form Logname_YYYY-MM-DD_HH-MM-SS.Ext for Logname.Ext
#
#    DBErrorLogFile
#        Log file of DB errors detected at server run
#        Default: "DBErrors.log"
#
#    ElunaErrorLogFile
#        Log file of Eluna errors detected at server run
#        Default: "world-eluna.log"
#
#    EventAIErrorLogFile
#        Log file of EventAI errors detected at server run
#        Default: "EventAIErrors.log"
#
#    CharLogFile
#        Character operations logfile name
#        Default: "Char.log"
#                 "" - Empty name disable creating log file
#
#    CharLogTimestamp
#        Logfile with timestamp of server start in name
#        Default: 0 - no timestamp in name
#                 1 - add timestamp in name in form Logname_YYYY-MM-DD_HH-MM-SS.Ext for Logname.Ext
#
#    CharLogDump
#        Write character dump before deleting in Char.log
#        For restoration, cut character data from log starting from
#        line == START DUMP == to line == END DUMP == (without its) in file and load it using loadpdump command
#        Default: 0 - don't include dumping chars to log
#                 1 - include dumping chars to log
#
#    GmLogFile
#        GM Log file of gm commands
#        Default: "" (Disable)
#
#    GmLogTimestamp
#        GM Logfile with timestamp of server start in name
#        Default: 0 - no timestamp in name
#                 1 - add timestamp in name in form Logname_YYYY-MM-DD_HH-MM-SS.Ext for Logname.Ext
#
#    GmLogPerAccount
#        GM Logfiles with GM account id (Note: logs not created if GmLogFile not set)
#        Default: 0 - add gm log data to single log file
#                 1 - add gm log data to account specific log files with name
#                     in form Logname_#ID_YYYY-MM-DD_HH-MM-SS.Ext
#                     or form Logname_#ID.Ext
#
#    RaLogFile
#        Log file of RA commands
#        Default: "Ra.log"
#                 "" - Empty name for disable
#
#    LogColors
#        Color for messages (format "normal_color details_color debug_color error_color")
#        Colors: 0 - BLACK, 1 - RED, 2 - GREEN,  3 - BROWN, 4 - BLUE, 5 - MAGENTA, 6 -  CYAN, 7 - GREY,
#                8 - YELLOW, 9 - LRED, 10 - LGREEN, 11 - LBLUE, 12 - LMAGENTA, 13 - LCYAN, 14 - WHITE
#        Default: "" - none colors
#        Example: "13 7 11 9"
#
################################################################################

LogSQL                      = 1
PidFile                     = ""
LogLevel                    = 3
LogTime                     = 0
LogFile                     = "world-server.log"
LogTimestamp                = 0
LogFileLevel                = 0
LogFilter_TransportMoves    = 1
LogFilter_CreatureMoves     = 1
LogFilter_VisibilityChanges = 1
LogFilter_Weather           = 1
LogFilter_DbStrictedCheck   = 1
LogFilter_Pathfinding       = 1
LogFilter_MapsLoading       = 1
LogFilter_EventAiDev        = 1
LogFilter_PeriodicAffects   = 0
LogFilter_PlayerMoves       = 1
LogFilter_SQLText           = 1
LogFilter_AIAndMovegens     = 0
LogFilter_PlayerStats       = 0
LogFilter_Damage            = 0
LogFilter_Combat            = 0
LogFilter_SpellCast         = 0
WorldLogFile                = "world-packets.log"
WorldLogTimestamp           = 0
DBErrorLogFile              = "world-database.log"
ElunaErrorLogFile           = "world-eluna.log"
EventAIErrorLogFile         = "world-eventai.log"
CharLogFile                 = "world-characters.log"
CharLogTimestamp            = 0
CharLogDump                 = 0
GmLogFile                   = "world-gamemaster.log"
GmLogTimestamp              = 0
GmLogPerAccount             = 0
RaLogFile                   = "world-remote-access.log"
LogColors                   = "13 7 11 9"

################################################################################
# SERVER SETTINGS
#
#    GameType
#        Server realm style
#        0 = NORMAL; 1 = PVP; 4 = NORMAL; 6 = RP; 8 = RPPVP
#        also custom type: 16 FFA_PVP (free for all pvp mode like arena PvP in all zones except rest
#        activated places and sanctuaries)
#
#    RealmZone
#        Server realm zone (set allowed alphabet in character names/etc). See also Strict*Names options.
#
#    1 Development    - any language (Default)
#    2 United States  - extended-Latin
#    3 Oceanic        - extended-Latin
#    4 Latin America  - extended-Latin
#    5 Tournament     - basic-Latin at create, any at login
#    6 Korea          - East-Asian
#    7 Tournament     - basic-Latin at create, any at login
#    8 English        - extended-Latin
#    9 German         - extended-Latin
#    10 French        - extended-Latin
#    11 Spanish       - extended-Latin
#    12 Russian       - Cyrillic
#    13 Tournament    - basic-Latin at create, any at login
#    14 Taiwan        - East-Asian
#    15 Tournament    - basic-Latin at create, any at login
#    16 China         - East-Asian
#    17 CN1           - basic-Latin at create, any at login
#    18 CN2           - basic-Latin at create, any at login
#    19 CN3           - basic-Latin at create, any at login
#    20 CN4           - basic-Latin at create, any at login
#    21 CN5           - basic-Latin at create, any at login
#    22 CN6           - basic-Latin at create, any at login
#    23 CN7           - basic-Latin at create, any at login
#    24 CN8           - basic-Latin at create, any at login
#    25 Tournament    - basic-Latin at create, any at login
#    26 Test Server   - any language
#    27 Tournament    - basic-Latin at create, any at login
#    28 QA Server     - any language
#    29 CN9           - basic-Latin at create, any at login
#
#    DBC.Locale
#        DBC Language Settings
#        0 = English; 1 = Korean; 2 = French; 3 = German; 4 = Chinese; 5 = Taiwanese; 6 = Spanish;
#        255 = Auto Detect (Default)
#
#    StrictPlayerNames
#        Limit player name to language specific symbols set, not allow create characters, and set rename request and disconnect at not allowed symbols name
#        Default: 0 disable (but limited server timezone dependent client check)
#                 1 basic latin characters  (strict)
#                 2 realm zone specific (strict). See RealmZone setting.
#                   Note: In any case if you want correctly see character name at client this client must have apporopriate fonts
#                   (included in client by default, with active official localization or custom localization fonts in clientdir/Fonts).
#                 3 basic latin characters + server timezone specific
#
#    StrictCharterNames
#        Limit guild team charter names to language specific symbols set, not allow create charters with not allowed symbols in name
#        Default: 0 disable
#                 1 basic latin characters  (strict)
#                 2 realm zone specific (strict). See RealmZone setting.
#                   Note: In any case if you want correctly see character name at client this client must have apporopriate fonts
#                   (included in client by default, with active official localization or custom localization fonts in clientdir/Fonts).
#                 3 basic latin characters + server timezone specific
#
#    StrictPetNames
#        Limit pet names to language specific symbols set
#        Default: 0 disable
#                 1 basic latin characters  (strict)
#                 2 realm zone specific (strict). See RealmZone setting.
#                   Note: In any case if you want correctly see character name at client this client must have apporopriate fonts
#                   (included in client by default, with active official localization or custom localization fonts in clientdir/Fonts).
#                 3 basic latin characters + server timezone specific
#
#    MinPlayerName
#        Minimal name length (1..12)
#        Default: 2
#
#    MinCharterName
#        Minimal name length (1..24)
#        Default: 2
#
#    MinPetName
#        Minimal name length (1..12)
#        Default: 2
#
#    CharactersCreatingDisabled
#        Disable characters creating for specific team or any (non-player accounts not affected)
#        Default: 0 - enabled
#                 1 - disabled only for Alliance
#                 2 - disabled only for Horde
#                 3 - disabled for both teams
#
#    CharactersPerAccount
#        Limit numbers of characters per account (at all realms).
#        Note: this setting limits the character creating at the _current_ realm base at characters amount at all realms
#        Default: 50
#                The number must be >= CharactersPerRealm
#
#    CharactersPerRealm
#        Limit numbers of characters for account at realm
#        Default: 10 (client limitation)
#                The number must be between 1 and 10
#
#    SkipCinematics
#        Disable in-game script movie at first character's login(allows to prevent buggy intro in case of custom start location coordinates)
#        Default: 0 - show intro for each new character
#                 1 - show intro only for first character of selected race
#                 2 - disable intro in all cases
#
#    MaxPlayerLevel
#        Max level that can be reached by a player for experience (in range from 1 to 100).
#        Change not recommended
#        Default: 60
#
#    StartPlayerLevel
#        Staring level that have character at creating (in range 1 to MaxPlayerLevel)
#        Default: 1
#
#    StartPlayerMoney
#        Amount of money that new players will start with.
#        If you want to start with one silver, use for example 100 (100 copper = 1 silver)
#        Default: 0
#
#    MaxHonorPoints
#        Max honor points that player can have.
#        Default: 75000
#
#    StartHonorPoints
#        Amount of honor that new players will start with
#        Default: 0
#
#    MinHonorKills
#        Min kills that players must obtain to enter in weekly honor calculation
#        Default: 15
#
#    MaintenanceDay
#        The day of the week is performed server maintenance ( currently used for Honor distribution )
#        range (0..6): 0 is the first day of the week (normally sunday), 6 is the latest
#        Default: 3 (Wednesday in EU)
#
#    InstantLogout
#        Enable or disable instant logout for security level (0..4) or high (NOT in combat/while dueling/while falling)
#        Default: 1 (Mods/GMs/Admins)
#
#    AllFlightPaths
#        Players will start with all flight paths (Note: ALL flight paths, not only player's team)
#        Default: 0 (true)
#                 1 (false)
#
#    AlwaysMaxSkillForLevel
#        Players will automatically gain max level dependent (weapon/defense) skill when logging in, leveling up etc.
#        Default: 0 (false)
#                 1 (true)
#
#    ActivateWeather
#        Activate weather system
#        Default: 1 (true)
#                 0 (false)
#
#    CastUnstuck
#        Allow cast Unstuck spell at .start or client Help option use
#        Default: 1 (true)
#                 0 (false)
#
#    MaxSpellCastsInChain
#        Max amount triggered spell casts in chain by one caster, prevent stack overflow crash
#        Too Low value will make some correct triggered casts fail
#                 0 (no limit)
#        Default: 20
#
#   RabbitDay
#        Set to Rabbit Day (date in unix time), only the day and month are considered, the year is not important
#        Default: 0 (off)
#        Suggested: 954547200 (April 1st, 2000)
#
#    Instance.IgnoreLevel
#        Ignore level requirement to enter instance
#        Default: 0 (false)
#                 1 (true)
#
#    Instance.IgnoreRaid
#        Ignore raid requirement to enter instance
#        Default: 0 (false)
#                 1 (true)
#
#    Instance.ResetTimeHour
#        The hour of the day (0-23) when the global instance resets occur.
#        Default: 4
#
#    Instance.UnloadDelay
#        Unload the instance map from memory after some time if no players are inside.
#        Default: 1800000 (miliseconds, i.e 30 minutes)
#                 0 (instance maps are kept in memory until they are reset)
#
#    Quests.LowLevelHideDiff
#        Quest level difference to hide for player low level quests:
#        if player_level > quest_level + LowLevelQuestsHideDiff then quest "!" mark not show for quest giver
#        Default: 4
#                -1 (show all available quests marks)
#
#    Quests.HighLevelHideDiff
#        Quest level difference to hide for player high level quests:
#        if player_level < quest_min_level - HighLevelQuestsHideDiff then quest "!" mark not show for quest giver
#        Default: 7
#                -1 (show all available quests marks)
#
#    Quests.IgnoreRaid
#        Non-raid quests allowed in raids
#        Default: 0 (not allowed)
#                 1 (allowed)
#
#    Guild.EventLogRecordsCount
#        Count of guild event log records stored in guild_eventlog table
#        Increase to store more guild events in table, minimum is 100
#        You can set it to very high value to prevent oldest guild events to be rewritten by latest guild events - but it can slow down performance
#        Default: 100
#
#    TimerBar.Fatigue.GMLevel
#        Disable/enable fatigue for security level (0..4) or high
#        Default: 4 (None)
#
#    TimerBar.Fatigue.Max
#        Fatigue max timer value (in secs)
#        Default: 60 (1 minute)
#                  0 (instant death)
#
#    TimerBar.Breath.GMLevel
#        Disable/enable waterbreathing for security level (0..4) or high
#        Default: 4 (None)
#
#    TimerBar.Breath.Max
#        Waterbreathing max timer value (in secs)
#        Default: 180
#                   0 (instant underwater breathing damage start)
#
#    TimerBar.Fire.GMLevel
#        Disable/enable lava fire damage for security level (0..4) or high
#        Default: 4 (None)
#
#    TimerBar.Fire.Max
#        Lava damage delay max timer value (in secs)
#        Default:  1
#                  0 (instant in lava damage start)
#
#    MaxPrimaryTradeSkill
#        Max count that player can learn the primary trade skill.
#        Default: 2
#        Max : 10
#
#    TradeSkill.GMIgnore.MaxPrimarySkillsCount
#        GM level starting from max primary skill count requirement ignored.
#        Default: 4 (Console as noneone)
#
#    TradeSkill.GMIgnore.Level
#        GM level starting from trade skill level requirement ignored.
#        Default: 4 (Console as noneone)
#
#    TradeSkill.GMIgnore.Skill
#        GM level starting from trade skill skill requirement ignored.
#        Default: 4 (Console as noneone)
#
#    MinPetitionSigns
#        Min signatures count to creating guild (0..9).
#        Default: 9
#
#    MaxGroupXPDistance
#        Max distance to creature for group memeber to get XP at creature death.
#        Default: 74
#
#    MailDeliveryDelay
#        Mail delivery delay time for item sending
#        Default: 3600 sec (1 hour)
#
#    MassMailer.SendPerTick
#        Max amount mail send each tick from mails list scheduled for mass mailer proccesing.
#        More mails increase server load but speedup mass mail proccess. Normal tick length: 50 msecs, so 20 ticks in sec and 200 mails in sec by default.
#        Default: 10
#
#    PetUnsummonAtMount
#        Permanent pet will unsummoned at player mount
#        Default: 0 - not unsummon
#                 1 - unsummon for any mount
#
#    Event.Announce
#        Default: 0 (false)
#                 1 (true)
#
#    BeepAtStart
#        Beep at mangosd start finished (mostly work only at Unix/Linux systems)
#        Default: 1 (true)
#                 0 (false)
#
#    ShowProgressBars
#        Control show progress bars for load steps at server startup
#        Default: 1 (true)
#                 0 (false)
#
#    WaitAtStartupError
#        After startup error report wait <Enter> or some time before continue (and possible close console window)
#                 -1 (wait until <Enter> press)
#        Default:  0 (not wait)
#                  N (>0, wait N secs)
#
#    PlayerCommands
#        Should player chat be parsed for GM commands.
#        Default: 0 (ignore commands)
#                 1 (parse commands)
#
#    Motd
#        Message of the Day. Displayed at worldlogin for every user ('@' for a newline).
#
################################################################################

GameType                                  = 1
RealmZone                                 = 1
DBC.Locale                                = 255
DeclinedNames                             = 0
StrictPlayerNames                         = 0
StrictCharterNames                        = 0
StrictPetNames                            = 0
MinPlayerName                             = 2
MinCharterName                            = 2
MinPetName                                = 2
CharactersCreatingDisabled                = 0
CharactersPerAccount                      = 50
CharactersPerRealm                        = 10
SkipCinematics                            = 0
MaxPlayerLevel                            = 60
StartPlayerLevel                          = 1
StartPlayerMoney                          = 0
MaxHonorPoints                            = 75000
StartHonorPoints                          = 0
MinHonorKills                             = 15
MaintenanceDay                            = 3
InstantLogout                             = 1
AllFlightPaths                            = 0
AlwaysMaxSkillForLevel                    = 0
ActivateWeather                           = 1
CastUnstuck                               = 1
MaxSpellCastsInChain                      = 20
RabbitDay                                 = 0
Instance.IgnoreLevel                      = 0
Instance.IgnoreRaid                       = 0
Instance.ResetTimeHour                    = 4
Instance.UnloadDelay                      = 1800000
Quests.LowLevelHideDiff                   = 4
Quests.HighLevelHideDiff                  = 7
Quests.IgnoreRaid                         = 0
Guild.EventLogRecordsCount                = 100
TimerBar.Fatigue.GMLevel                  = 4
TimerBar.Fatigue.Max                      = 60
TimerBar.Breath.GMLevel                   = 4
TimerBar.Breath.Max                       = 180
TimerBar.Fire.GMLevel                     = 4
TimerBar.Fire.Max                         = 1
MaxPrimaryTradeSkill                      = 2
TradeSkill.GMIgnore.MaxPrimarySkillsCount = 4
TradeSkill.GMIgnore.Level                 = 4
TradeSkill.GMIgnore.Skill                 = 4
MinPetitionSigns                          = 9
MaxGroupXPDistance                        = 74
MailDeliveryDelay                         = 3600
MassMailer.SendPerTick                    = 10
PetUnsummonAtMount                        = 0
Event.Announce                            = 0
BeepAtStart                               = 1
ShowProgressBars                          = 1
WaitAtStartupError                        = 0
PlayerCommands                            = 0
Motd                                      = "Welcome to the World of Warcraft."

################################################################################
# PLAYER INTERACTION
#
#    AllowTwoSide.Accounts
#        Allow accounts to create characters in both teams in any game type.
#        Default: 0 (Not allowed)
#                 1 (Allowed)
#
#    AllowTwoSide.Interaction.Chat
#    AllowTwoSide.Interaction.Channel
#    AllowTwoSide.Interaction.Group
#    AllowTwoSide.Interaction.Guild
#    AllowTwoSide.Interaction.Trade
#    AllowTwoSide.Interaction.Auction
#    AllowTwoSide.Interaction.Mail
#        Allow or not common :chat(say,yell);channel(chat)group(join)guild(join);trade with different team,
#        merge all auction houses for players from different teams, send mail to different team.
#        Default: 0 (Not allowed)
#                 1 (Allowed)
#
#    AllowTwoSide.WhoList
#        Allow show player from both team in who list.
#        Default: 0 (Not allowed)
#                 1 (Allowed)
#
#    AllowTwoSide.AddFriend
#        Allow adding friends from other team in friend list.
#        Default: 0 (Not allowed)
#                 1 (Allowed)
#
#    TalentsInspecting
#        Allow other players see character talents in inspect dialog (Characters in Gamemaster mode can
#        inspect talents always)
#        Default: 1 (allow)
#                 0 (not allow)
#
################################################################################

AllowTwoSide.Accounts            = 0
AllowTwoSide.Interaction.Chat    = 0
AllowTwoSide.Interaction.Channel = 0
AllowTwoSide.Interaction.Group   = 0
AllowTwoSide.Interaction.Guild   = 0
AllowTwoSide.Interaction.Trade   = 0
AllowTwoSide.Interaction.Auction = 0
AllowTwoSide.Interaction.Mail    = 0
AllowTwoSide.WhoList             = 0
AllowTwoSide.AddFriend           = 0
TalentsInspecting                = 1

################################################################################
# CREATURE AND GAMEOBJECT SETTINGS
#
#    ThreatRadius
#        Radius for creature to evade after being pulled away from combat start point
#        If ThreatRadius is less than creature aggro radius then aggro radius will be used
#        Default: 100 yards
#
#    Rate.Creature.Aggro
#        Aggro radius percent or off.
#        Default: 1   - 100%
#                 1.5 - 150%
#                 0   - off (0%)
#
#    CreatureFamilyFleeAssistanceRadius
#        Radius which creature will use to seek for a near creature for assistance. Creature will flee to this creature.
#        Default: 30
#                 0   - off
#
#    CreatureFamilyAssistanceRadius
#        Radius which creature will use to call assistance without moving
#        Default: 10
#                 0   - off
#
#    CreatureFamilyAssistanceDelay
#        Reaction time for creature assistance call
#        Default: 1500 (1.5s)
#
#    CreatureFamilyFleeDelay
#        Time during which creature can flee when no assistant found
#        Default: 7000 (7s)
#
#    WorldBossLevelDiff
#        Difference for boss dynamic level with target
#        Default: 3
#
#    Corpse.EmptyLootShow
#        If target can have loot (or can be skining after loot) but no loot generated still show loot window
#        Default: 1 (show)
#                 0 (not show)
#
#    Corpse.Decay.NORMAL
#    Corpse.Decay.RARE
#    Corpse.Decay.ELITE
#    Corpse.Decay.RAREELITE
#    Corpse.Decay.WORLDBOSS
#        Seconds until creature corpse will decay without being looted or skinned (not used when creature does not have loot initially)
#        Default: 300, 900, 600, 1200, 3600
#
#    Rate.Corpse.Decay.Looted
#         Controls how long the creature corpse stays after it had been looted, as a multiplier of its Corpse.Decay.* config.
#         Default: 0.0 (will use modifier /3 of the creatures spawntimesecs when 0.0)
#
#    Rate.Creature.Normal.Damage
#    Rate.Creature.Elite.Elite.Damage
#    Rate.Creature.Elite.RAREELITE.Damage
#    Rate.Creature.Elite.WORLDBOSS.Damage
#    Rate.Creature.Elite.RARE.Damage
#        Creature Damage Rates.
#        Examples: 2 - creatures will damage 2x, 1.7 - 1.7x.
#
#    Rate.Creature.Normal.SpellDamage
#    Rate.Creature.Elite.Elite.SpellDamage
#    Rate.Creature.Elite.RAREELITE.SpellDamage
#    Rate.Creature.Elite.WORLDBOSS.SpellDamag
#    Rate.Creature.Elite.RARE.SpellDamage
#        Creature Spell Damage Rates.
#        Examples: 2 - creatures will damage with spells 2x, 1.7 - 1.7x.
#
#    Rate.Creature.Normal.HP
#    Rate.Creature.Elite.Elite.HP
#    Rate.Creature.Elite.RAREELITE.HP
#    Rate.Creature.Elite.WORLDBOSS.HP
#    Rate.Creature.Elite.RARE.HP
#        Creature Health Ammount Modifier.
#        Examples: 2 - creatures have 2x health, 1.7 - 1.7x.
#
#    ListenRange.Say
#        Distance from player to listen text that creature (or other world object) say
#        Default: 40
#
#    ListenRange.TextEmote
#        Distance from player to listen textemote that creature (or other world object) say
#        Default: 40
#
#    ListenRange.Yell
#        Distance from player to listen text that creature (or other world object) yell
#        Default: 300
#
#    GuidReserveSize.Creature
#    GuidReserveSize.GameObject
#        Amount guids reserved for .npc add/.gobject add directly after last used in DB static spawned creature/gameobject guid
#        Commands .npc add/.gobject add can be used only for guids from this reserve and required server restart if all guids
#        from reserve used before above commands can be used in like case. Less size increase amount guids for dynamic spawns
#        in game from other side
#        Default: 100
#
################################################################################

ThreatRadius                              = 100
Rate.Creature.Aggro                       = 1
CreatureFamilyFleeAssistanceRadius        = 30
CreatureFamilyAssistanceRadius            = 10
CreatureFamilyAssistanceDelay             = 1500
CreatureFamilyFleeDelay                   = 7000
WorldBossLevelDiff                        = 3
Corpse.EmptyLootShow                      = 1
Corpse.Decay.NORMAL                       = 300
Corpse.Decay.RARE                         = 900
Corpse.Decay.ELITE                        = 600
Corpse.Decay.RAREELITE                    = 1200
Corpse.Decay.WORLDBOSS                    = 3600
Rate.Corpse.Decay.Looted                  = 0.0
Rate.Creature.Elite.Elite.Damage          = 1
Rate.Creature.Elite.Elite.HP              = 1
Rate.Creature.Elite.Elite.SpellDamage     = 1
Rate.Creature.Elite.RARE.Damage           = 1
Rate.Creature.Elite.RARE.HP               = 1
Rate.Creature.Elite.RARE.SpellDamage      = 1
Rate.Creature.Elite.RAREELITE.Damage      = 1
Rate.Creature.Elite.RAREELITE.HP          = 1
Rate.Creature.Elite.RAREELITE.SpellDamage = 1
Rate.Creature.Elite.WORLDBOSS.Damage      = 1
Rate.Creature.Elite.WORLDBOSS.HP          = 1
Rate.Creature.Elite.WORLDBOSS.SpellDamage = 1
Rate.Creature.Normal.Damage               = 1
Rate.Creature.Normal.HP                   = 1
Rate.Creature.Normal.SpellDamage          = 1

ListenRange.Say                           = 40
ListenRange.TextEmote                     = 40
ListenRange.Yell                          = 300

GuidReserveSize.Creature                  = 100
GuidReserveSize.GameObject                = 100

################################################################################
# CHAT SETTINGS
#
#    ChatFakeMessagePreventing
#        Chat protection from creating fake messages using a lot spaces (other invisible symbols),
#        not applied to addon language messages, but can prevent working old addons
#        that use normal languages for sending data to another clients.
#        Default: 0 (disable fake messages preventing)
#                 1 (enable fake messages preventing)
#
#    ChatStrictLinkChecking.Severity
#        Check chat messages for ingame links to spells, items, quests, achievements etc.
#        Default: 0 (disable link checking)
#                 1 (check if only valid pipe commands are used. This prevents posting pictures for example)
#                 2 (verifiy that pipe commands are used in a correct order)
#                 3 (check if color, entry and name don't contradict each other. For correct work, please assure
#                    that you have extracted locale DBCs of every language specific client playing on this server.)
#
#    ChatStrictLinkChecking.Kick
#        Defines, what should be done if a message is considered to contain invalid pipe commands.
#        Default: 0 (silently ignore message)
#                 1 (kick players who sent invalid formed messages)
#
#    ChatFlood.MessageCount
#        Chat anti-flood protection, haste message count to activate protection
#        Default: 10
#                 0 (disable anti-flood protection)
#
#    ChatFlood.MessageDelay
#        Chat anti-flood protection, minimum message delay to count message
#        Default: 1 (in secs)
#
#    ChatFlood.MuteTime
#        Chat anti-flood protection, mute time at activation flood protection (not saved)
#        Default: 10 (in secs)
#
#    Channel.SilentlyGMJoin
#        Silently join GM characters (security level > 1) to channels
#        Default: 0 (join announcement in normal way)
#                 1 (GM join without announcement)
#
################################################################################

ChatFakeMessagePreventing       = 0
ChatStrictLinkChecking.Severity = 0
ChatStrictLinkChecking.Kick     = 0
ChatFlood.MessageCount          = 10
ChatFlood.MessageDelay          = 1
ChatFlood.MuteTime              = 10
Channel.SilentlyGMJoin          = 0

################################################################################
# GAME MASTER SETTINGS
#
#    GM.LoginState
#        GM mode at login
#        Default: 2 (last save state)
#                 0 (disable)
#                 1 (enable)
#
#    GM.Visible
#        GM visibility at login
#        Default: 2 (last save state)
#                 0 (invisible)
#                 1 (visible)
#
#    GM.AcceptTickets
#        Is GM accepting tickets from player by default or not.
#        Default: 2 (last save state)
#                 0 (disable)
#                 1 (enable)
#
#    GM.Chat
#        GM chat mode at login
#        Default: 2 (last save state)
#                 0 (disable)
#                 1 (enable)
#
#    GM.WhisperingTo
#        Is GM accepting whispers from player by default or not.
#        Default: 2 (last save state)
#                 0 (disable)
#                 1 (enable)
#
#    GM.InGMList.Level
#        Max GM level showed in GM list (if visible) in non-GM state (.gm off)
#                 0 (none)
#                 1 (only moderators)
#                 2 (only gamemasters)
#        Default: 3 (anyone)
#
#    GM.InWhoList.Level
#        Max GM level showed in who list (if visible).
#                 0 (only players)
#                 1 (only moderators)
#                 2 (only gamemasters)
#        Default: 3 (anyone)
#
#    GM.LogTrade
#        Include GM trade and trade slot enchanting operations in GM log if it enable
#        Default: 1 (include)
#                 0 (not include)
#
#    GM.StartLevel
#        GM starting level (1-255)
#        Default: 1
#
#    GM.LowerSecurity
#        Disallow a lower security member to interact with a higher one using commands
#        Default: 0 (disable)
#                 1 (enable)
#
#    GM.InvisibleAura
#        A spell that will be cast when a gm uses ".gm visible off" (Must be aura spell)
#        Default: 31748 (Spirit Particles, big)
#                 0 (Disabled)
#
################################################################################

GM.LoginState      = 2
GM.Visible         = 2
GM.AcceptTickets   = 2
GM.Chat            = 2
GM.WhisperingTo    = 2
GM.InGMList.Level  = 3
GM.InWhoList.Level = 3
GM.LogTrade        = 1
GM.StartLevel      = 1
GM.LowerSecurity   = 0
GM.InvisibleAura   = 31748

################################################################################
# VISIBILITY AND RADIUSES
#
#    Visibility.GroupMode
#        Group visibility modes
#        Default: 0 (standard setting: only members from same group can 100% auto detect invisible player)
#                 1 (raid members 100% auto detect invisible player from same raid)
#                 2 (players from same team can 100% auto detect invisible player)
#
#    Visibility.Distance.Continents
#    Visibility.Distance.Instances
#    Visibility.Distance.BG
#        Visibility distance for different ingame object in different maps.
#        Visibility on continents on offy ~90 yards. In BG ~180. For instances default ~120.
#        Max limited by active player zone: ~ 333
#        Min limit is max aggro radius (45) * Rate.Creature.Aggro
#
#    Visibility.Distance.InFlight
#        Visible distance for player in flight
#        Min limit is 0 (not show any objects)
#
#    Visibility.Distance.Grey.Unit
#        Visibility grey distance for creatures/players (fast changing objects)
#        addition to appropriate object type Visibility.Distance.* use in case visibility removing to
#        object (except corpse around distances) If D is distance and G is grey distance then object
#        make visible if distance to it <= D but make non visible if distance > D+G
#        Default: 1 (yard)
#
#    Visibility.Distance.Grey.Object
#        Visibility grey distance for dynobjects/gameobjects/corpses/creature bodies
#        Default: 10 (yards)
#
#    Visibility.RelocationLowerLimit
#        Object's visibility update called, when distance between current object's position and position,
#        where visiblity was updated last time, reaches RelocationLoverLimit value
#        Default: 10 (yards)
#
#    Visibility.AIRelocationNotifyDelay
#        Delay time between creature AI reactions on nearby movements
#        Default: 1000 (milliseconds)
#
################################################################################

Visibility.GroupMode               = 0
Visibility.Distance.Continents     = 90
Visibility.Distance.Instances      = 120
Visibility.Distance.BG             = 180
Visibility.Distance.InFlight       = 100
Visibility.Distance.Grey.Unit      = 1
Visibility.Distance.Grey.Object    = 10
Visibility.RelocationLowerLimit    = 10
Visibility.AIRelocationNotifyDelay = 1000

################################################################################
# SERVER RATES
#
#    Rate.Health
#    Rate.Mana
#    Rate.Rage.Income
#    Rate.Rage.Loss
#    Rate.Focus
#    Rate.Loyalty
#    Rate.Energy (Rogue)
#        Health and power regeneration and rage income from damage.
#        Default: 1
#
#    Rate.Skill.Discovery
#         Skill Discovery Rates
#         Default: 1
#
#    Rate.Drop.Item.Poor
#    Rate.Drop.Item.Normal
#    Rate.Drop.Item.Uncommon
#    Rate.Drop.Item.Rare
#    Rate.Drop.Item.Epic
#    Rate.Drop.Item.Legendary
#    Rate.Drop.Item.Artifact
#    Rate.Drop.Item.Referenced
#    Rate.Drop.Money
#         Drop rates (items by quality and money)
#         Default: 1
#
#    Rate.XP.Kill
#    Rate.XP.PetKill
#    Rate.XP.Quest
#    Rate.XP.Explore
#        XP rates
#        Default: 1
#
#    Rate.Rest.InGame
#    Rate.Rest.Offline.InTavernOrCity
#    Rate.Rest.Offline.InWilderness
#        Resting points grow rates (1 - normal, 2 - double rate, 0.5 - half rate, etc) from standard values
#
#    Rate.Damage.Fall
#        Damage after fall rate. (1 - standard, 2 - double damage, 0.5 - half damage, etc)
#
#    Rate.Auction.Time
#    Rate.Auction.Deposit
#    Rate.Auction.Cut
#        Auction rates (auction time, deposit get at auction start, auction cut from price at auction end)
#
#    Auction.Deposit.Min
#        Minimum auction deposit size in copper
#        Default: 0
#
#    Rate.Honor
#        Honor gain rate
#
#    Rate.Mining.Amount
#    Rate.Mining.Next
#        Mining Rates (Mining.Amount changes minimum/maximum usetimes of a deposit,
#        Mining.Next changes chance to have next use of a deposit)
#
#    Rate.Talent
#        Talent Point rates
#        Default: 1
#
#    Rate.Reputation.Gain
#         Reputation Gain rate
#         Default: 1
#
#    Rate.Reputation.LowLevel.Kill
#         Reputation Gain form low level kill (grey creture)
#         Default: 0.2
#
#    Rate.Reputation.LowLevel.Quest
#         Reputation Gain rate
#         Default: 1
#
#    Rate.InstanceResetTime
#        Multiplier for the number of days in between global raid/heroic instance resets.
#        Default: 1
#
#    SkillGain.Crafting
#    SkillGain.Defense
#    SkillGain.Gathering
#    SkillGain.Weapon
#         crafting/defense/gathering/weapon skills gain at skill grow (1,2,...)
#         Default: 1
#
#    SkillChance.Orange
#    SkillChance.Yellow
#    SkillChance.Green
#    SkillChance.Grey
#        Skill chance values (0..100)
#        Default: 100-75-25-0
#
#    SkillChance.MiningSteps
#    SkillChance.SkinningSteps
#         For skinning and Mining chance decrease with skill level.
#         Default: 0  - no decrease
#                  75 - in 2 times each 75 skill points
#
#    SkillFail.Loot.Fishing
#         For fishing instead fail provided junk loot
#         Default: 0 (disabled)
#                  1 (enabled)
#
#    SkillFail.Gain.Fishing
#         For fishing skill gain possible at fail also
#         Default: 0 (disabled)
#                  1 (enabled)
#
#    SkillFail.Possible.FishingPool
#         For fishing pool impossible fail from low skill by default
#         Default: 1 (enabled)
#                  0 (disabled)
#
#    DurabilityLossChance.Damage
#         Chance lost one from equiped items durability point at damage apply or receive.
#         Default: 0.5 (100/0.5 = 200) Each 200 damage apply one from 19 possible equipped items
#
#    DurabilityLossChance.Absorb
#         Chance lost one from armor items durability point at damage absorb.
#         Default: 0.5 (100/0.5 = 200) Each 200 absorbs apply one from 15 possible armor equipped items
#
#    DurabilityLossChance.Parry
#         Chance lost weapon durability point at parry.
#         Default: 0.05 (100/0.05 = 2000) Each 2000 parry attacks main weapon lost point
#
#    DurabilityLossChance.Block
#         Chance lost sheild durability point at damage block.
#         Default: 0.05 (100/0.05 = 2000) Each 2000 partly or full blocked attacks shield lost point
#
#    Death.SicknessLevel
#         Starting Character start gain sickness at spirit resurrection (1 min)
#         Default: 11
#                  -10 - character will have full time (10min) sickness at 1 level
#                  maxplayerlevel+1 - character will not have sickness at any level
#
#    Death.CorpseReclaimDelay.PvP
#    Death.CorpseReclaimDelay.PvE
#         Enabled/disabled increase corpse reclaim delay at often PvP/PvE deaths
#         Default: 1 (enabled)
#                  0 (disabled)
#
#    Death.Bones.World
#    Death.Bones.Battleground
#         Enabled/disabled creating bones instead corpse at resurrection (in normal zones/instacnes, or battleground)
#         Default: 1 (enabled)
#                  0 (disabled)
#
#    Death.Ghost.RunSpeed.World
#    Death.Ghost.RunSpeed.Battleground
#         Modifies the speed of player's ghosts, removed upon reviving, not permanent/saved, in non-BG and BG maps
#         Default: 1.0 (normal speed)
#
################################################################################

Rate.Health                       = 1
Rate.Mana                         = 1
Rate.Rage.Income                  = 1
Rate.Rage.Loss                    = 1
Rate.Focus                        = 1
Rate.Loyalty                      = 1
Rate.Energy                       = 1
Rate.Skill.Discovery              = 1
Rate.Drop.Item.Poor               = 1
Rate.Drop.Item.Normal             = 1
Rate.Drop.Item.Uncommon           = 1
Rate.Drop.Item.Rare               = 1
Rate.Drop.Item.Epic               = 1
Rate.Drop.Item.Legendary          = 1
Rate.Drop.Item.Artifact           = 1
Rate.Drop.Item.Referenced         = 1
Rate.Drop.Money                   = 1
Rate.XP.Kill                      = 1
Rate.XP.PetKill                   = 1
Rate.XP.Quest                     = 1
Rate.XP.Explore                   = 1
Rate.Rest.InGame                  = 1
Rate.Rest.Offline.InTavernOrCity  = 1
Rate.Rest.Offline.InWilderness    = 1
Rate.Damage.Fall                  = 1
Rate.Auction.Time                 = 1
Rate.Auction.Deposit              = 1
Rate.Auction.Cut                  = 1
Auction.Deposit.Min               = 0
Rate.Honor                        = 1
Rate.Mining.Amount                = 1
Rate.Mining.Next                  = 1
Rate.Talent                       = 1
Rate.Reputation.Gain              = 1
Rate.Reputation.LowLevel.Kill     = 0.2
Rate.Reputation.LowLevel.Quest    = 1
Rate.InstanceResetTime            = 1

SkillGain.Crafting                = 1
SkillGain.Defense                 = 1
SkillGain.Gathering               = 1
SkillGain.Weapon                  = 1

SkillChance.Orange                = 100
SkillChance.Yellow                = 75
SkillChance.Green                 = 25
SkillChance.Grey                  = 0
SkillChance.MiningSteps           = 0
SkillChance.SkinningSteps         = 0

SkillFail.Loot.Fishing            = 0
SkillFail.Gain.Fishing            = 0
SkillFail.Possible.FishingPool    = 1

DurabilityLossChance.Damage       = 0.5
DurabilityLossChance.Absorb       = 0.5
DurabilityLossChance.Parry        = 0.05
DurabilityLossChance.Block        = 0.05

Death.SicknessLevel               = 11
Death.CorpseReclaimDelay.PvP      = 1
Death.CorpseReclaimDelay.PvE      = 1
Death.Bones.World                 = 1
Death.Bones.Battleground          = 1
Death.Ghost.RunSpeed.World        = 1.0
Death.Ghost.RunSpeed.Battleground = 1.0

################################################################################
# BATTLEGROUND CONFIG
#
#    Battleground.CastDeserter
#        Cast Deserter spell at player who leave battleground in progress
#        Default: 1 (enable)
#                 0 (disable)
#
#    Battleground.QueueAnnouncer.Join
#        Enable queue announcer posting to chat at join
#        Default: 0 (not send)
#                 1 (send to joined player only)
#                 2 (send to all players)
#
#    Battleground.QueueAnnouncer.Start
#        Enable queue announcer posting to chat at BG start
#        Default: 0 (disable)
#                 1 (enable)
#
#    Battleground.InvitationType
#        Set Battleground invitation type
#        Default: 0 (normal - invite as much players to bg as possible, don't bother with ballance)
#                 1 (Experimental - don't allow to invite much more players of one faction)
#
#    Battleground.PrematureFinishTimer
#        The time to end the bg if there are less than MinPlayersPerTeam on one side in milliseconds
#        Default: 300000 (5 minutes)
#                 0 - disable (not recommended)
#
#    BattleGround.PremadeGroupWaitForMatch
#        The time in which premade group of 1 faction waits in BG Queue for premade group of other faction
#                 1800000 (30 minutes)
#        Default: 0 - disable premade group matches (group always added to bg team in normal way)
#
################################################################################

Battleground.CastDeserter             = 1
Battleground.QueueAnnouncer.Join      = 0
Battleground.QueueAnnouncer.Start     = 0
Battleground.InvitationType           = 0
BattleGround.PrematureFinishTimer     = 300000
BattleGround.PremadeGroupWaitForMatch = 0

################################################################################
# OUTDOOR PVP CONFIG
#
#    OutdoorPvp.SIEnabled               #Enable Silithus Outdoor pvp
#    OutdoorPvp.EPEnabled               #Enable Eastern Plaguelands Outdoor pvp
#        Default: 1 (enable)
#                 0 (disable)
#
################################################################################

OutdoorPvp.SIEnabled = 1
OutdoorPvp.EPEnabled = 1

################################################################################
# NETWORK CONFIG
#
#    Network.Threads
#         Number of threads for network, recommend 1 thread per 1000 connections.
#         Default: 1
#
#    Network.OutKBuff
#         The size of the output kernel buffer used ( SO_SNDBUF socket option, tcp manual ).
#         Default: -1 (Use system default setting)
#
#    Network.OutUBuff
#         Userspace buffer for output. This is amount of memory reserved per each connection.
#         Default: 65536
#
#    Network.TcpNoDelay:
#         TCP Nagle algorithm setting
#         Default: 0 (enable Nagle algorithm, less traffic, more latency)
#                  1 (TCP_NO_DELAY, disable Nagle algorithm, more traffic but less latency)
#
#    Network.KickOnBadPacket
#         Kick player on bad packet format.
#         Default: 0 - do not kick
#                  1 - kick
#
################################################################################

Network.Threads         = 1
Network.OutKBuff        = -1
Network.OutUBuff        = 65536
Network.TcpNodelay      = 1
Network.KickOnBadPacket = 0

################################################################################
# CONSOLE, REMOTE ACCESS AND SOAP
#
#    Console.Enable
#        Enable console
#        Default: 1 - on
#                 0 - off
#
#    Ra.Enable
#        Enable remote console
#        Default: 0 - off
#                 1 - on
#
#    Ra.IP
#        Default remote console ip address, use 0.0.0.0 for every address
#
#    Ra.Port
#        Default remote console port
#        Default: 3443
#
#    Ra.MinLevel
#        Minimum level that's required to login,3 by default
#        Default: 3 (Administrator)
#
#    Ra.Secure
#        Kick client on wrong pass
#                 0 - off
#        Default: 1 - on
#
#    Ra.Stricted
#        Not allow execute console level only commands remotly by RA
#                 0 - off
#        Default: 1 - on
#
#
#    SOAP.Enable
#        Enable soap service
#        Default: 0 - off
#                 1 - on
#
#    SOAP.IP
#        Bound SOAP service ip address, use 0.0.0.0 to access from everywhere
#        Default: 127.0.0.1
#
#    SOAP.Port
#        SOAP port
#        Default: 7878
#
################################################################################

Console.Enable = 0

Ra.Enable      = 0
Ra.IP          = 0.0.0.0
Ra.Port        = 3443
Ra.MinLevel    = 3
Ra.Secure      = 1
Ra.Stricted    = 1

SOAP.Enabled   = 0
SOAP.IP        = 127.0.0.1
SOAP.Port      = 7878

################################################################################
#    CharDelete.Method
#        Character deletion behavior
#        Default: 0  - Completely remove the character from the database
#                 1  - Unlinking, the character gets unlinked from the account,
#                      the name gets freed up and appears as deleted ingame
#
#    CharDelete.MinLevel
#        Character gets deleted by CharDelete.Method=0 when the character
#        hasn't the specified level yet.
#        Default: 0  - For all characters the specified mode will be used
#                 1+ - Only for players which have reached the specified level
#                      will be deleted by the specified mode.
#                      the rest will be deleted by CharDelete.Method=0
#
#    CharDelete.KeepDays
#        Define the amount of days for which the characters are kept in the database before
#        they will be removed
#        Default: 30
#                 0  - Don't delete any characters, they stay in the database forever.
#
################################################################################

CharDelete.Method   = 0
CharDelete.MinLevel = 0
CharDelete.KeepDays = 30

###################################################################################################################
# ELUNA SETTINGS
#
#    Eluna.Enabled
#        Enable Enabled Eluna LuaEngine
#        Default: 1 (Enabled)
#                 0 (Disabled)
#
###################################################################################################################
Eluna.Enabled = 1
