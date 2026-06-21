tellraw @s {"text":"[RespawnTeam] In the process of being implemented!","color":"gold"}

# Attempt to revive all dead teammates 
execute if entity @s[team=Team1,tag=!dead] as @a[team=Team1,tag=dead] if score @s TTL_TimeDead >= RespawnWaitTime TTL_Config run function tyloxonteamlives:respawn
execute if entity @s[team=Team2,tag=!dead] as @a[team=Team2,tag=dead] if score @s TTL_TimeDead >= RespawnWaitTime TTL_Config run function tyloxonteamlives:respawn
execute if entity @s[team=Team3,tag=!dead] as @a[team=Team3,tag=dead] if score @s TTL_TimeDead >= RespawnWaitTime TTL_Config run function tyloxonteamlives:respawn
execute if entity @s[team=Team4,tag=!dead] as @a[team=Team4,tag=dead] if score @s TTL_TimeDead >= RespawnWaitTime TTL_Config run function tyloxonteamlives:respawn

# Reset trigger
scoreboard players reset @s RespawnTeam
scoreboard players enable @s RespawnTeam