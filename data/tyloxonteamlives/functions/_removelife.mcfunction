scoreboard players operation TempIf TTL_Config = @s RemoveLife

# Remove a life from the specified team
execute if score TempIf TTL_Config matches 1 if score Team1 TTL_TeamLives matches 1.. run scoreboard players remove Team1 TTL_TeamLives 1
execute if score TempIf TTL_Config matches 2 if score Team2 TTL_TeamLives matches 1.. run scoreboard players remove Team2 TTL_TeamLives 1
execute if score TempIf TTL_Config matches 3 if score Team3 TTL_TeamLives matches 1.. run scoreboard players remove Team3 TTL_TeamLives 1
execute if score TempIf TTL_Config matches 4 if score Team4 TTL_TeamLives matches 1.. run scoreboard players remove Team4 TTL_TeamLives 1

# Success message
execute if score TempIf TTL_Config matches 1 run tellraw @s [{"text":"[TTL-RemoveLife] Team 1 now has ","color":"green"},{"score":{"name":"Team1","objective":"TTL_TeamLives"}},{"text":" lives."}]
execute if score TempIf TTL_Config matches 2 run tellraw @s [{"text":"[TTL-RemoveLife] Team 2 now has ","color":"green"},{"score":{"name":"Team2","objective":"TTL_TeamLives"}},{"text":" lives."}]
execute if score TempIf TTL_Config matches 3 run tellraw @s [{"text":"[TTL-RemoveLife] Team 3 now has ","color":"green"},{"score":{"name":"Team3","objective":"TTL_TeamLives"}},{"text":" lives."}]
execute if score TempIf TTL_Config matches 4 run tellraw @s [{"text":"[TTL-RemoveLife] Team 4 now has ","color":"green"},{"score":{"name":"Team4","objective":"TTL_TeamLives"}},{"text":" lives."}]

# Error message
execute unless score TempIf TTL_Config matches 1..4 run tellraw @s [{"text":"[TTL-RemoveLife] Failed to remove a life from team ","color":"red"},{"score":{"name":"TempIf","objective":"TTL_Config"}},{"text":"!"}]

# Reset trigger
scoreboard players reset @s RemoveLife
scoreboard players enable @s RemoveLife