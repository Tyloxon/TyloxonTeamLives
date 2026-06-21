# Set TempIf to the player's team number
scoreboard players set TempIf TTL_Config 0
execute if entity @s[team=Team1] run scoreboard players set TempIf TTL_Config 1
execute if entity @s[team=Team2] run scoreboard players set TempIf TTL_Config 2
execute if entity @s[team=Team3] run scoreboard players set TempIf TTL_Config 3
execute if entity @s[team=Team4] run scoreboard players set TempIf TTL_Config 4

# Tell player what team they're in
execute unless score TempIf TTL_Config matches 0 run tellraw @s [{"text":"You are in Team ","color":"gold","bold":true},{"score":{"name":"TempIf","objective":"TTL_Config"}}]

# Tell them how many lives their team has
execute if entity @s[team=Team1] run scoreboard players operation TempMath TTL_Config = Team1 TTL_TeamLives
execute if entity @s[team=Team2] run scoreboard players operation TempMath TTL_Config = Team2 TTL_TeamLives
execute if entity @s[team=Team3] run scoreboard players operation TempMath TTL_Config = Team3 TTL_TeamLives
execute if entity @s[team=Team4] run scoreboard players operation TempMath TTL_Config = Team4 TTL_TeamLives
execute unless score TempIf TTL_Config matches 0 run tellraw @s [{"text":"  +  ","color":"gold"},{"text":"Remaining Lives = ","color":"aqua"},{"score":{"name":"TempMath","objective":"TTL_Config"},"color":"white"}]

# Tell them how many players are in their team
scoreboard players set TempMath TTL_Config 0
execute if entity @s[team=Team1] as @a[team=Team1] run scoreboard players add TempMath TTL_Config 1
execute if entity @s[team=Team2] as @a[team=Team2] run scoreboard players add TempMath TTL_Config 1
execute if entity @s[team=Team3] as @a[team=Team3] run scoreboard players add TempMath TTL_Config 1
execute if entity @s[team=Team4] as @a[team=Team4] run scoreboard players add TempMath TTL_Config 1
execute unless score TempIf TTL_Config matches 0 run tellraw @s [{"text":"  +  ","color":"gold"},{"text":"Total players = ","color":"green"},{"score":{"name":"TempMath","objective":"TTL_Config"},"color":"white"}]

# Tell them how many eliminated players are in their team
scoreboard players set TempMath TTL_Config 0
execute if entity @s[team=Team1] as @a[team=Team1,tag=eliminated] run scoreboard players add TempMath TTL_Config 1
execute if entity @s[team=Team2] as @a[team=Team2,tag=eliminated] run scoreboard players add TempMath TTL_Config 1
execute if entity @s[team=Team3] as @a[team=Team3,tag=eliminated] run scoreboard players add TempMath TTL_Config 1
execute if entity @s[team=Team4] as @a[team=Team4,tag=eliminated] run scoreboard players add TempMath TTL_Config 1
execute unless score TempIf TTL_Config matches 0 run tellraw @s [{"text":"  +  ","color":"gold"},{"text":"Eliminated players = ","color":"red"},{"score":{"name":"TempMath","objective":"TTL_Config"},"color":"white"}]

# Player is not in a team
execute if score TempIf TTL_Config matches 0 run tellraw @s [{"text":"[TTL-TeamInfo] You are not in a team!","color":"red"}]

# Reset trigger
scoreboard players reset @s TeamInfo
scoreboard players enable @s TeamInfo