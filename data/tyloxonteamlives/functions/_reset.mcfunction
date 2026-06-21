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

# Remove "dead" and "eliminated" tags from players
execute as @a[tag=dead] run tag @s remove dead
execute as @a[tag=eliminated] run tag @s remove eliminated
execute as @a[tag=respawning] run tag @s remove respawning

# Invoke load function
function tyloxonteamlives:load

# Success message
tellraw @s {"text":"The datapack TyloxonTeamLives has been reset!\nThis does not include settings and admins, they are still the same.","color":"gold"}

# Reset trigger
scoreboard players reset @s TTL_Reset
scoreboard players enable @s TTL_Reset