# Remove teams
team remove Team1
team remove Team2
team remove Team3
team remove Team4

# Remove scoreboards
scoreboard objectives remove TTL_Config
scoreboard objectives remove TTL_ReadyPlayers
scoreboard objectives remove TTL_Admins
scoreboard objectives remove TTL_TeamLives
scoreboard objectives remove TTL_Deaths
scoreboard objectives remove TTL_PrevDeaths
scoreboard objectives remove TTL_TimeDead
scoreboard objectives remove TTL_RespawnDelay
scoreboard objectives remove TTL_PlayerLivesVisual

# Remove global triggers
scoreboard objectives remove RespawnTeam
scoreboard objectives remove TeamInfo

# Remove admin triggers
scoreboard objectives remove JoinTeam
scoreboard objectives remove ResetConfig
scoreboard objectives remove ResetLives
scoreboard objectives remove GiveLife
scoreboard objectives remove RemoveLife
scoreboard objectives remove ShowTeamLives
scoreboard objectives remove BroadcastTeamLives
scoreboard objectives remove TTL_Cleanup
scoreboard objectives remove TTL_Reset

# Remove "dead" and "eliminated" tags from players
execute as @a[tag=dead] run tag @s remove dead
execute as @a[tag=eliminated] run tag @s remove eliminated
execute as @a[tag=respawning] run tag @s remove respawning

# Success message
tellraw @s {"text":"The datapack TyloxonTeamLives has been cleaned up from this save.\nPlease note: It will re-initialise if you reload the save with the datapack enabled!","color":"gold"}

# No need to clean up triggers because we delete them in this function :>