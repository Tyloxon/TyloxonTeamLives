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

# Remove global triggers
scoreboard objectives remove RespawnTeam
scoreboard objectives remove JoinTeam

# Remove admin triggers
scoreboard objectives remove ResetConfig
scoreboard objectives remove ResetLives
scoreboard objectives remove GiveLife
scoreboard objectives remove TakeLife
scoreboard objectives remove ShowTeamLives
scoreboard objectives remove BroadcastTeamLives
scoreboard objectives remove TTL_Cleanup

# Remove "dead" tags from players
execute as @a[tag=dead] run tag @s remove dead
