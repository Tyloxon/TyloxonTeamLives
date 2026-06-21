scoreboard players operation TempIf TTL_Config = @s TakeLife

# Remove a life from the specified team
execute if score TempIf TTL_Config matches 1 if score Team1 TTL_TeamLives matches 1.. run scoreboard players remove Team1 TTL_TeamLives 1
execute if score TempIf TTL_Config matches 2 if score Team2 TTL_TeamLives matches 1.. run scoreboard players remove Team2 TTL_TeamLives 1
execute if score TempIf TTL_Config matches 3 if score Team3 TTL_TeamLives matches 1.. run scoreboard players remove Team3 TTL_TeamLives 1
execute if score TempIf TTL_Config matches 4 if score Team4 TTL_TeamLives matches 1.. run scoreboard players remove Team4 TTL_TeamLives 1

# Reset trigger
scoreboard players reset @s TakeLife
scoreboard players enable @s TakeLife