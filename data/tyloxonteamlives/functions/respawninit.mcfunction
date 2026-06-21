# Get whether they can respawn
# If they can't respawn, give "eliminated" tag  !!!!!!!!!!!!!!
# Decrement team's lives by one
# Clear player's TimeDead
# Set gamemode to survival
# Teleport to random teammate
# Removes "dead" tag

# Get if team has remaining lives
scoreboard players set TempIf TTL_Config 0
execute as @s[team=Team1] if score Team1 TTL_TeamLives matches 1.. run scoreboard players set TempIf TTL_Config 1
execute as @s[team=Team2] if score Team2 TTL_TeamLives matches 1.. run scoreboard players set TempIf TTL_Config 1
execute as @s[team=Team3] if score Team3 TTL_TeamLives matches 1.. run scoreboard players set TempIf TTL_Config 1
execute as @s[team=Team4] if score Team4 TTL_TeamLives matches 1.. run scoreboard players set TempIf TTL_Config 1

# If no more team lives, eliminate the player
execute if score TempIf TTL_Config matches 0 run function tyloxonteamlives:eliminate

# Decrement team lives if should respawn
execute as @s[team=Team1] if score TempIf TTL_Config matches 1 run scoreboard players remove Team1 TTL_TeamLives 1
execute as @s[team=Team2] if score TempIf TTL_Config matches 1 run scoreboard players remove Team2 TTL_TeamLives 1
execute as @s[team=Team3] if score TempIf TTL_Config matches 1 run scoreboard players remove Team3 TTL_TeamLives 1
execute as @s[team=Team4] if score TempIf TTL_Config matches 1 run scoreboard players remove Team4 TTL_TeamLives 1

# Give "respawning" tag to player
tag @s add respawning