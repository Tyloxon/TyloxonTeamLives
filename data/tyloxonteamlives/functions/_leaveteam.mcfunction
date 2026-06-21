# Get team the player is part of
scoreboard players set TempIf TTL_Config 0
execute if entity @s[team=Team1] run scoreboard players set TempIf TTL_Config 1
execute if entity @s[team=Team2] run scoreboard players set TempIf TTL_Config 2
execute if entity @s[team=Team3] run scoreboard players set TempIf TTL_Config 3
execute if entity @s[team=Team4] run scoreboard players set TempIf TTL_Config 4

# Remove the player from any teams
team leave @s

# Success message
execute unless score TempIf TTL_Config matches 0 run tellraw @s [{"text":"[TTL-LeaveTeam] You have left Team ","color":"green"},{"score":{"name":"TempIf","objective":"TTL_Config"}},{"text":"."}]
# Fail message
execute if score TempIf TTL_Config matches 0 run tellraw @s {"text":"[TTL-LeaveTeam] You are not in any teams.","color":"red"}

# Reset trigger
scoreboard players reset @s LeaveTeam
scoreboard players enable @s LeaveTeam