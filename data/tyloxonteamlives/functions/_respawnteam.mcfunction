tellraw @s {"text":"Attempting to respawn your teammates!","color":"gold"}

# Set TimeDead of calling player to -1 so respawn functions know where to spawn the dead teammates
scoreboard players set @s TTL_TimeDead -1

# Attempt to revive all dead teammates 
execute if entity @s[team=Team1,tag=!dead] as @a[team=Team1,tag=dead,tag=!eliminated,tag=!respawning] if score @s TTL_TimeDead >= RespawnWaitTime TTL_Config run function tyloxonteamlives:respawninit
execute if entity @s[team=Team2,tag=!dead] as @a[team=Team2,tag=dead,tag=!eliminated,tag=!respawning] if score @s TTL_TimeDead >= RespawnWaitTime TTL_Config run function tyloxonteamlives:respawninit
execute if entity @s[team=Team3,tag=!dead] as @a[team=Team3,tag=dead,tag=!eliminated,tag=!respawning] if score @s TTL_TimeDead >= RespawnWaitTime TTL_Config run function tyloxonteamlives:respawninit
execute if entity @s[team=Team4,tag=!dead] as @a[team=Team4,tag=dead,tag=!eliminated,tag=!respawning] if score @s TTL_TimeDead >= RespawnWaitTime TTL_Config run function tyloxonteamlives:respawninit

# Reset trigger
scoreboard players reset @s RespawnTeam
scoreboard players enable @s RespawnTeam