# Remove teams
team remove Team1
team remove Team2
team remove Team3
team remove Team4

# Remove scoreboards
scoreboard objectives remove TTL_ReadyPlayers
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
scoreboard objectives remove LeaveTeam
scoreboard objectives remove ResetConfig
scoreboard objectives remove ResetLives
scoreboard objectives remove GiveLife
scoreboard objectives remove RemoveLife
scoreboard objectives remove ShowTeamLives
scoreboard objectives remove BroadcastTeamLives
scoreboard objectives remove TTL_Cleanup
scoreboard objectives remove TTL_Reset

# Remove tags from players
execute as @a[tag=dead] run tag @s remove dead
execute as @a[tag=eliminated] run tag @s remove eliminated
execute as @a[tag=respawning] run tag @s remove respawning
execute as @a[tag=spectated] run tag @s remove spectated

# Invoke load function
function tyloxonteamlives:load

# Success message
tellraw @s {"text":"[TTL-Reset] The datapack TyloxonTeamLives has been reset! This does not include settings and admins.","color":"gold"}

# Reset trigger
scoreboard players reset @s TTL_Reset
scoreboard players enable @s TTL_Reset