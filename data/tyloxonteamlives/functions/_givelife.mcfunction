scoreboard players operation TempIf TTL_Config = @s GiveLife

# Give a life to the specified team
execute if score TempIf TTL_Config matches 1 run scoreboard players add Team1 TTL_TeamLives 1
execute if score TempIf TTL_Config matches 2 run scoreboard players add Team2 TTL_TeamLives 1
execute if score TempIf TTL_Config matches 3 run scoreboard players add Team3 TTL_TeamLives 1
execute if score TempIf TTL_Config matches 4 run scoreboard players add Team4 TTL_TeamLives 1

# Success message
execute if score TempIf TTL_Config matches 1 run tellraw @s [{"text":"[TTL-GiveLife] Team 1 now has ","color":"green"},{"score":{"name":"Team1","objective":"TTL_TeamLives"}},{"text":" lives."}]
execute if score TempIf TTL_Config matches 2 run tellraw @s [{"text":"[TTL-GiveLife] Team 2 now has ","color":"green"},{"score":{"name":"Team2","objective":"TTL_TeamLives"}},{"text":" lives."}]
execute if score TempIf TTL_Config matches 3 run tellraw @s [{"text":"[TTL-GiveLife] Team 3 now has ","color":"green"},{"score":{"name":"Team3","objective":"TTL_TeamLives"}},{"text":" lives."}]
execute if score TempIf TTL_Config matches 4 run tellraw @s [{"text":"[TTL-GiveLife] Team 4 now has ","color":"green"},{"score":{"name":"Team4","objective":"TTL_TeamLives"}},{"text":" lives."}]

# Error message
execute unless score TempIf TTL_Config matches 1..4 run tellraw @s [{"text":"[TTL-GiveLife] Failed to give a life to team ","color":"red"},{"score":{"name":"TempIf","objective":"TTL_Config"}},{"text":" (doesn't exist)!"}]

# Reset trigger
scoreboard players reset @s GiveLife
scoreboard players enable @s GiveLife