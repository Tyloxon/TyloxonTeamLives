# Initialise global triggers
execute as @a unless score @s TTL_ReadyPlayers 1.. run scoreboard players enable @s RespawnTeam
execute as @a unless score @s TTL_ReadyPlayers 1.. run scoreboard players enable @s JoinTeam
execute as @a unless score @s TTL_ReadyPlayers 1.. run scoreboard players set @s TTL_ReadyPlayers 1

# Initialise admin triggers
execute as @a[scores={TTL_Admins=1..}] unless score @s TTL_ReadyPlayers 2.. run scoreboard players enable @s ResetConfig
execute as @a[scores={TTL_Admins=1..}] unless score @s TTL_ReadyPlayers 2.. run scoreboard players enable @s ResetLives
execute as @a[scores={TTL_Admins=1..}] unless score @s TTL_ReadyPlayers 2.. run scoreboard players enable @s ShowTeamLives
execute as @a[scores={TTL_Admins=1..}] unless score @s TTL_ReadyPlayers 2.. run scoreboard players enable @s BroadcastTeamLives
execute as @a[scores={TTL_Admins=1..}] unless score @s TTL_ReadyPlayers 2.. run scoreboard players set @s TTL_ReadyPlayers 2

# ...

# Handle global triggers
execute as @a[scores={RespawnTeam=1..}] run function tyloxonteamlives:_respawnteam
execute as @a[scores={JoinTeam=1..}] run function tyloxonteamlives:_jointeam

# Handle admin triggers
execute as @a[scores={ResetLives=1..}] run function tyloxonteamlives:_resetconfig
execute as @a[scores={ResetLives=1..}] run function tyloxonteamlives:_resetlives
execute as @a[scores={ShowTeamLives=1..}] run function tyloxonteamlives:_showteamlives
execute as @a[scores={BroadcastTeamLives=1..}] run function tyloxonteamlives:_broadcastteamlives
