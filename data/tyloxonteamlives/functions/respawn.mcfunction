# Teleport player to teammate who respawned them (well, try at least)
execute as @s[team=Team1] run tp @s @a[team=Team1,scores={TTL_TimeDead=-1},limit=1]
execute as @s[team=Team2] run tp @s @a[team=Team2,scores={TTL_TimeDead=-1},limit=1]
execute as @s[team=Team3] run tp @s @a[team=Team3,scores={TTL_TimeDead=-1},limit=1]
execute as @s[team=Team4] run tp @s @a[team=Team4,scores={TTL_TimeDead=-1},limit=1]

# (FALLBACK) Teleport player to random alive teammate
execute as @s[team=Team1] at @s unless entity @a[team=Team1,tag=!dead,distance=..1] run tp @s @r[team=Team1,tag=!dead]
execute as @s[team=Team2] at @s unless entity @a[team=Team2,tag=!dead,distance=..1] run tp @s @r[team=Team2,tag=!dead]
execute as @s[team=Team3] at @s unless entity @a[team=Team3,tag=!dead,distance=..1] run tp @s @r[team=Team3,tag=!dead]
execute as @s[team=Team4] at @s unless entity @a[team=Team4,tag=!dead,distance=..1] run tp @s @r[team=Team4,tag=!dead]

# Move slightly behind teammate they respawned on
execute at @s rotated as @a[sort=nearest,limit=1] run tp ^ ^ ^-0.5

# OLD CODE (TempMath stored num of teammates alive)
###execute if score TempMath TTL_Config matches 0 run scoreboard players remove @s TTL_Deaths 1
###execute if score TempMath TTL_Config matches 0 run kill @s

# Put player into survival mode
execute run gamemode survival @s

# Remove "dead" and "respawning" tag from player
execute run tag @s remove dead
execute run tag @s remove respawning

# Clear player's TimeDead
execute run scoreboard players reset @s TTL_TimeDead
execute run scoreboard players reset @s TTL_RespawnDelay

# Reset caller TimeDead
execute if entity @s[team=Team1] as @a[team=Team1,scores={TTL_TimeDead=-1}] run scoreboard players reset @s TTL_TimeDead
execute if entity @s[team=Team2] as @a[team=Team2,scores={TTL_TimeDead=-1}] run scoreboard players reset @s TTL_TimeDead
execute if entity @s[team=Team3] as @a[team=Team3,scores={TTL_TimeDead=-1}] run scoreboard players reset @s TTL_TimeDead
execute if entity @s[team=Team4] as @a[team=Team4,scores={TTL_TimeDead=-1}] run scoreboard players reset @s TTL_TimeDead