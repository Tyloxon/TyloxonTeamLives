# Enable global triggers
execute as @a unless score @s TTL_ReadyPlayers matches 1.. run scoreboard players enable @s RespawnTeam

# Initialise PrevDeaths
execute as @a unless score @s TTL_ReadyPlayers matches 1.. run scoreboard players set @s TTL_PrevDeaths 0

# Enable admin triggers for admins
execute as @a[scores={TTL_Admins=1..}] unless score @s TTL_ReadyPlayers matches 2.. run scoreboard players enable @s JoinTeam
execute as @a[scores={TTL_Admins=1..}] unless score @s TTL_ReadyPlayers matches 2.. run scoreboard players enable @s ResetConfig
execute as @a[scores={TTL_Admins=1..}] unless score @s TTL_ReadyPlayers matches 2.. run scoreboard players enable @s ResetLives
execute as @a[scores={TTL_Admins=1..}] unless score @s TTL_ReadyPlayers matches 2.. run scoreboard players enable @s GiveLife
execute as @a[scores={TTL_Admins=1..}] unless score @s TTL_ReadyPlayers matches 2.. run scoreboard players enable @s TakeLife
execute as @a[scores={TTL_Admins=1..}] unless score @s TTL_ReadyPlayers matches 2.. run scoreboard players enable @s ShowTeamLives
execute as @a[scores={TTL_Admins=1..}] unless score @s TTL_ReadyPlayers matches 2.. run scoreboard players enable @s BroadcastTeamLives
execute as @a[scores={TTL_Admins=1..}] unless score @s TTL_ReadyPlayers matches 2.. run scoreboard players enable @s TTL_Cleanup
execute as @a[scores={TTL_Admins=1..}] unless score @s TTL_ReadyPlayers matches 2.. run scoreboard players set @s TTL_ReadyPlayers 2

# Disable admin triggers for players removed from admin
execute as @a[scores={TTL_ReadyPlayers=2..}] unless score @s TTL_Admins matches 1 run scoreboard players reset @s JoinTeam
execute as @a[scores={TTL_ReadyPlayers=2..}] unless score @s TTL_Admins matches 1 run scoreboard players reset @s ResetConfig
execute as @a[scores={TTL_ReadyPlayers=2..}] unless score @s TTL_Admins matches 1 run scoreboard players reset @s ResetLives
execute as @a[scores={TTL_ReadyPlayers=2..}] unless score @s TTL_Admins matches 1 run scoreboard players reset @s GiveLife
execute as @a[scores={TTL_ReadyPlayers=2..}] unless score @s TTL_Admins matches 1 run scoreboard players reset @s TakeLife
execute as @a[scores={TTL_ReadyPlayers=2..}] unless score @s TTL_Admins matches 1 run scoreboard players reset @s ShowTeamLives
execute as @a[scores={TTL_ReadyPlayers=2..}] unless score @s TTL_Admins matches 1 run scoreboard players reset @s BroadcastTeamLives
execute as @a[scores={TTL_ReadyPlayers=2..}] unless score @s TTL_Admins matches 1 run scoreboard players reset @s TTL_Cleanup
execute as @a[scores={TTL_ReadyPlayers=2..}] unless score @s TTL_Admins matches 1 run scoreboard players set @s TTL_ReadyPlayers 1

# Set team lives visual (shown in tab list)
execute as @a[team=Team1] run scoreboard players operation @s TTL_PlayerLivesVisual = Team1 TTL_TeamLives
execute as @a[team=Team2] run scoreboard players operation @s TTL_PlayerLivesVisual = Team2 TTL_TeamLives
execute as @a[team=Team3] run scoreboard players operation @s TTL_PlayerLivesVisual = Team3 TTL_TeamLives
execute as @a[team=Team4] run scoreboard players operation @s TTL_PlayerLivesVisual = Team4 TTL_TeamLives

# Update time dead for dead players, validate spectating players
execute as @a[tag=dead,tag=!eliminated] run scoreboard players add @s TTL_TimeDead 1
execute as @a[tag=dead] run function tyloxonteamlives:spectate

# Attempt respawn on players who have been dead for longer than the respawn timeout
execute as @a[tag=dead,tag=!eliminated] if score @s TTL_TimeDead >= RespawnTimeout TTL_Config run function tyloxonteamlives:respawn

# Handle deaths
execute as @a if score @s TTL_Deaths > @s TTL_PrevDeaths run function tyloxonteamlives:processdeath

# Handle global triggers
execute as @a[scores={RespawnTeam=1..}] run function tyloxonteamlives:_respawnteam

# Handle admin triggers
execute as @a[scores={JoinTeam=1..}] run function tyloxonteamlives:_jointeam
execute as @a[scores={ResetConfig=1..}] run function tyloxonteamlives:_resetconfig
execute as @a[scores={ResetLives=1..}] run function tyloxonteamlives:_resetlives
execute as @a[scores={GiveLife=1..}] run function tyloxonteamlives:_givelife
execute as @a[scores={TakeLife=1..}] run function tyloxonteamlives:_takelife
execute as @a[scores={ShowTeamLives=1..}] run function tyloxonteamlives:_showteamlives
execute as @a[scores={BroadcastTeamLives=1..}] run function tyloxonteamlives:_broadcastteamlives
execute as @a[scores={TTL_Cleanup=1..}] run function tyloxonteamlives:_cleanup
