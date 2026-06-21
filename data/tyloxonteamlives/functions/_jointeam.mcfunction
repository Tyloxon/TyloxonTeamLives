scoreboard players operation TempIf TTL_Config = @s JoinTeam

# Set teams
execute if score TempIf TTL_Config matches 1 run team join Team1
execute if score TempIf TTL_Config matches 2 run team join Team2
execute if score TempIf TTL_Config matches 3 run team join Team3
execute if score TempIf TTL_Config matches 4 run team join Team4

# Setup way for the player
function tyloxonteamlives:wayplayersetup

# Success message
execute unless score TempIf TTL_Config matches 5.. run tellraw @s [{"text":"You have joined team","color":"green"},{"score":{"name":"TempIf","objective":"TTL_Config"}}]
# Fail message
execute if score TempIf TTL_Config matches 5.. run tellraw @s {"text":"That is an invalid team! Try a number between 1 and 4.","color":"red"}

# Reset trigger
scoreboard players reset @s JoinTeam
scoreboard players enable @s JoinTeam