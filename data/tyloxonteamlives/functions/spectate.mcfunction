# Set TempIf to whether the player has any alive teammates
scoreboard players set TempIf TTL_Config 0
execute as @s[team=Team1,tag=dead] if entity @a[team=Team1,tag=!dead] run scoreboard players set TempIf TTL_Config 1
execute as @s[team=Team2,tag=dead] if entity @a[team=Team2,tag=!dead] run scoreboard players set TempIf TTL_Config 1
execute as @s[team=Team3,tag=dead] if entity @a[team=Team3,tag=!dead] run scoreboard players set TempIf TTL_Config 1
execute as @s[team=Team4,tag=dead] if entity @a[team=Team4,tag=!dead] run scoreboard players set TempIf TTL_Config 1

# Teleport spectator to nearest alive teammate if not within 10 blocks of that teammate
execute as @s[team=Team1] if score TempIf TTL_Config matches 1.. at @s unless entity @a[team=Team1,tag=!dead,distance=..10] run tp @s @a[team=Team1,tag=!dead,sort=nearest,limit=1]
execute as @s[team=Team2] if score TempIf TTL_Config matches 1.. at @s unless entity @a[team=Team2,tag=!dead,distance=..10] run tp @s @a[team=Team2,tag=!dead,sort=nearest,limit=1]
execute as @s[team=Team3] if score TempIf TTL_Config matches 1.. at @s unless entity @a[team=Team3,tag=!dead,distance=..10] run tp @s @a[team=Team3,tag=!dead,sort=nearest,limit=1]
execute as @s[team=Team4] if score TempIf TTL_Config matches 1.. at @s unless entity @a[team=Team4,tag=!dead,distance=..10] run tp @s @a[team=Team4,tag=!dead,sort=nearest,limit=1]

# Otherwise, they can just free roam
