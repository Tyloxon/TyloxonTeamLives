scoreboard players operation TempIf TTL_Config = @s GiveLife

# Give a life to the specified team
execute if score TempIf TTL_Config matches 1 run scoreboard players add Team1 TTL_TeamLives 1
execute if score TempIf TTL_Config matches 2 run scoreboard players add Team2 TTL_TeamLives 1
execute if score TempIf TTL_Config matches 3 run scoreboard players add Team3 TTL_TeamLives 1
execute if score TempIf TTL_Config matches 4 run scoreboard players add Team4 TTL_TeamLives 1

# Reset trigger
scoreboard players reset @s GiveLife
scoreboard players enable @s GiveLife