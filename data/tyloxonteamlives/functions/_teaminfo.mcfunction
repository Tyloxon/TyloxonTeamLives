# Set TempIf to the player's team number
scoreboard players set TempIf TTL_Config 0
execute if entity @s[team=Team1] run scoreboard players set TempIf TTL_Config 1
execute if entity @s[team=Team2] run scoreboard players set TempIf TTL_Config 2
execute if entity @s[team=Team3] run scoreboard players set TempIf TTL_Config 3
execute if entity @s[team=Team4] run scoreboard players set TempIf TTL_Config 4

# Tell player what team they're in
execute unless score TempIf TTL_Config matches 0 run tellraw @s [{"text":"You are in Team ","color":"gold"},{"score":{"name":"TempIf","objective":"TTL_Config"}},{"text":"."}]

# Player is not in a team
execute if score TempIf TTL_Config matches 0 run tellraw @s [{"text":"You are not in a team!","color":"gold"}]

# Reset trigger
scoreboard players reset @s TeamInfo
scoreboard players enable @s TeamInfo