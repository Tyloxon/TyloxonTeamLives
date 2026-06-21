# Get team's lives
# Add tag "dead"
# Set gamemode to spectator
# Set time dead to zero, it will start counting up

# Check whether the player is in a team
scoreboard players set TempIf TTL_Config 0
execute if entity @s[team=Team1] run scoreboard players set TempIf TTL_Config 1
execute if entity @s[team=Team2] run scoreboard players set TempIf TTL_Config 1
execute if entity @s[team=Team3] run scoreboard players set TempIf TTL_Config 1
execute if entity @s[team=Team4] run scoreboard players set TempIf TTL_Config 1

# Tag player as dead, set their TimeDead to 0, make them spectator
execute if score TempIf TTL_Config matches 1 run tag @s add dead
execute if score TempIf TTL_Config matches 1 run scoreboard players set @s TTL_TimeDead 0
execute if score TempIf TTL_Config matches 1 run gamemode spectator @s

# Set TempMath to number of teammates still alive
scoreboard players set TempMath TTL_Config 0
execute if entity @s[team=Team1] as @a[team=Team1,tag=!dead,tag=!eliminated,tag=!respawning] run scoreboard players add TempMath TTL_Config 1
execute if entity @s[team=Team2] as @a[team=Team2,tag=!dead,tag=!eliminated,tag=!respawning] run scoreboard players add TempMath TTL_Config 1
execute if entity @s[team=Team3] as @a[team=Team3,tag=!dead,tag=!eliminated,tag=!respawning] run scoreboard players add TempMath TTL_Config 1
execute if entity @s[team=Team4] as @a[team=Team4,tag=!dead,tag=!eliminated,tag=!respawning] run scoreboard players add TempMath TTL_Config 1

# If no teammates are alive, eliminate the team, set team lives to zero
execute if score EliminateDeadTeams TTL_Config matches 1 if score TempMath TTL_Config matches 0 if entity @s[team=Team1] as @a[team=Team1] run function tyloxonteamlives:eliminate
execute if score EliminateDeadTeams TTL_Config matches 1 if score TempMath TTL_Config matches 0 if entity @s[team=Team2] as @a[team=Team2] run function tyloxonteamlives:eliminate
execute if score EliminateDeadTeams TTL_Config matches 1 if score TempMath TTL_Config matches 0 if entity @s[team=Team3] as @a[team=Team3] run function tyloxonteamlives:eliminate
execute if score EliminateDeadTeams TTL_Config matches 1 if score TempMath TTL_Config matches 0 if entity @s[team=Team4] as @a[team=Team4] run function tyloxonteamlives:eliminate

execute if score EliminateDeadTeams TTL_Config matches 1 if score TempMath TTL_Config matches 0 if entity @s[team=Team1] run scoreboard players set Team1 TTL_TeamLives 0
execute if score EliminateDeadTeams TTL_Config matches 1 if score TempMath TTL_Config matches 0 if entity @s[team=Team2] run scoreboard players set Team2 TTL_TeamLives 0
execute if score EliminateDeadTeams TTL_Config matches 1 if score TempMath TTL_Config matches 0 if entity @s[team=Team3] run scoreboard players set Team3 TTL_TeamLives 0
execute if score EliminateDeadTeams TTL_Config matches 1 if score TempMath TTL_Config matches 0 if entity @s[team=Team4] run scoreboard players set Team4 TTL_TeamLives 0

# Update PrevDeaths
scoreboard players operation @s TTL_PrevDeaths = @s TTL_Deaths