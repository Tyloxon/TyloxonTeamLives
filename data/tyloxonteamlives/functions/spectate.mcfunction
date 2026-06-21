# Set TempIf to whether the player has any alive teammates
scoreboard players set TempIf TTL_Config 0
execute as @s[team=Team1,tag=dead] if entity @a[team=Team1,tag=!dead] run scoreboard players set TempIf TTL_Config 1
execute as @s[team=Team2,tag=dead] if entity @a[team=Team2,tag=!dead] run scoreboard players set TempIf TTL_Config 1
execute as @s[team=Team3,tag=dead] if entity @a[team=Team3,tag=!dead] run scoreboard players set TempIf TTL_Config 1
execute as @s[team=Team4,tag=dead] if entity @a[team=Team4,tag=!dead] run scoreboard players set TempIf TTL_Config 1

# Teleport spectator to nearest alive teammate if not within X blocks of any teammate
execute as @s[team=Team1] if score TempIf TTL_Config matches 1.. at @s unless entity @a[team=Team1,tag=!dead,distance=..8] run tag @a[team=Team4,tag=!dead,sort=nearest,limit=1] add spectated
execute as @s[team=Team2] if score TempIf TTL_Config matches 1.. at @s unless entity @a[team=Team2,tag=!dead,distance=..8] run tag @a[team=Team4,tag=!dead,sort=nearest,limit=1] add spectated
execute as @s[team=Team3] if score TempIf TTL_Config matches 1.. at @s unless entity @a[team=Team3,tag=!dead,distance=..8] run tag @a[team=Team4,tag=!dead,sort=nearest,limit=1] add spectated
execute as @s[team=Team4] if score TempIf TTL_Config matches 1.. at @s unless entity @a[team=Team4,tag=!dead,distance=..8] run tag @a[team=Team4,tag=!dead,sort=nearest,limit=1] add spectated

execute at @e[tag=spectated,limit=1] rotated as @e[tag=spectated] run tp @s ^ ^1 ^-3

# Teleport spectator testing code with non-player entity
#execute as @s[team=Team1] at @s unless entity @e[tag=spectate_test,distance=..8] run tag @e[tag=spectate_test,sort=nearest,limit=1] add spectated
#execute as @s[team=Team2] at @s unless entity @e[tag=spectate_test,distance=..8] run tag @e[tag=spectate_test,sort=nearest,limit=1] add spectated
#execute as @s[team=Team3] at @s unless entity @e[tag=spectate_test,distance=..8] run tag @e[tag=spectate_test,sort=nearest,limit=1] add spectated
#execute as @s[team=Team4] at @s unless entity @e[tag=spectate_test,distance=..8] run tag @e[tag=spectate_test,sort=nearest,limit=1] add spectated

#execute at @e[tag=spectated,limit=1] rotated as @e[tag=spectated] run tp @s ^ ^1 ^-3

# Remove tag from spectated player
tag @e[tag=spectated] remove spectated

# Otherwise, they can just free roam
