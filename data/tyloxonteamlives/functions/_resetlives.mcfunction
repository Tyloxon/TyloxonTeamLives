scoreboard players operation Team1 TTL_TeamLives = InitialTeamLives TTL_Config
scoreboard players operation Team2 TTL_TeamLives = InitialTeamLives TTL_Config
scoreboard players operation Team3 TTL_TeamLives = InitialTeamLives TTL_Config
scoreboard players operation Team4 TTL_TeamLives = InitialTeamLives TTL_Config

tellraw @s {"text":"[TTL-ResetLives] All team lives have been reset!","color":"green"}

# Reset trigger
scoreboard players reset @s ResetLives
scoreboard players enable @s ResetLives