# Load message
tellraw @a {"text":"[TyloxonTeamLives] Loading right now biitchesss!","color":"green"}

# Config for the datapack
scoreboard objectives add TTL_Config dummy
execute unless score LoadedOnce TTL_Config matches 1 run function tyloxonteamlives:resetconfig
execute unless score LoadedOnce TTL_Config matches 1 run scoreboard players set LoadedOnce TTL_Config 1

# Teams, set their display names and colours here
team add Team1
team modify Team1 displayName "The Undertakers"
team modify Team1 color green
team modify Team1 nametagVisibility hideForOtherTeams
team add Team2
team modify Team2 displayName "Desolate"
team modify Team2 color aqua
team modify Team2 nametagVisibility hideForOtherTeams
team add Team3
team modify Team3 displayName "5 Billion Bombs"
team modify Team3 color red
team modify Team3 nametagVisibility hideForOtherTeams
team add Team4
team modify Team4 displayName "Squeak Squad"
team modify Team4 color gray
team modify Team4 nametagVisibility hideForOtherTeams

# Way setup
function tyloxonteamlives:waysetup

# Initialise scoreboards
scoreboard objectives add TTL_ReadyPlayers dummy
scoreboard objectives add TTL_Admins dummy
scoreboard objectives add TTL_TeamLives dummy
scoreboard objectives add TTL_Deaths deathCount
scoreboard objectives add TTL_PrevDeaths dummy
scoreboard objectives add TTL_TimeDead dummy
scoreboard objectives add TTL_RespawnDelay dummy
scoreboard objectives add TTL_PlayerLivesVisual dummy

scoreboard objectives setdisplay list TTL_PlayerLivesVisual

# Initialise team lives
scoreboard players operation Team1 TTL_TeamLives = InitialTeamLives TTL_Config
scoreboard players operation Team2 TTL_TeamLives = InitialTeamLives TTL_Config
scoreboard players operation Team3 TTL_TeamLives = InitialTeamLives TTL_Config
scoreboard players operation Team4 TTL_TeamLives = InitialTeamLives TTL_Config

# Register global triggers
scoreboard objectives add RespawnTeam trigger
scoreboard objectives add TeamInfo trigger

# Register admin triggers
scoreboard objectives add JoinTeam trigger
scoreboard objectives add ResetConfig trigger
scoreboard objectives add ResetLives trigger
scoreboard objectives add GiveLife trigger
scoreboard objectives add RemoveLife trigger
scoreboard objectives add ShowTeamLives trigger
scoreboard objectives add BroadcastTeamLives trigger
scoreboard objectives add TTL_Reset trigger
scoreboard objectives add TTL_Cleanup trigger

# Set loaded once
scoreboard players set LoadedOnce TTL_Config 1