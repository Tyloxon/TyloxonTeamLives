# Get whether they can respawn
# If they can't respawn, give "eliminated" tag
# If all teammates are dead, can't respawn, give "eliminated" tag
# Decrement team's lives by one
# Clear player's TimeDead
# Set gamemode to survival
# Teleport to random teammate
# Removes "dead" tag

# Get number of lives remaining in player's team
scoreboard players set TempIf TTL_Config 0
execute as @s[team=Team1] if score Team1 TTL_TeamLives matches 1.. run scoreboard players set TempIf TTL_Config 1
execute as @s[team=Team2] if score Team2 TTL_TeamLives matches 1.. run scoreboard players set TempIf TTL_Config 1
execute as @s[team=Team3] if score Team3 TTL_TeamLives matches 1.. run scoreboard players set TempIf TTL_Config 1
execute as @s[team=Team4] if score Team4 TTL_TeamLives matches 1.. run scoreboard players set TempIf TTL_Config 1

# Decrement team lives if should respawn
execute as @s[team=Team1] if score TempIf TTL_Config matches 1 run scoreboard players remove Team1 TTL_TeamLives 1
execute as @s[team=Team2] if score TempIf TTL_Config matches 1 run scoreboard players remove Team2 TTL_TeamLives 1
execute as @s[team=Team3] if score TempIf TTL_Config matches 1 run scoreboard players remove Team3 TTL_TeamLives 1
execute as @s[team=Team4] if score TempIf TTL_Config matches 1 run scoreboard players remove Team4 TTL_TeamLives 1

# Set TempMath to number of teammates still alive
scoreboard players set TempMath TTL_Config 0
execute if entity @s[team=Team1] as @a[team=Team1,tag=!dead] run scoreboard players add TempMath TTL_Config 1
execute if entity @s[team=Team2] as @a[team=Team2,tag=!dead] run scoreboard players add TempMath TTL_Config 1
execute if entity @s[team=Team3] as @a[team=Team3,tag=!dead] run scoreboard players add TempMath TTL_Config 1
execute if entity @s[team=Team4] as @a[team=Team4,tag=!dead] run scoreboard players add TempMath TTL_Config 1

# Teleport player to random alive teammate, or...
execute as @s[team=Team1] if score TempIf TTL_Config matches 1 unless score TempMath TTL_Config matches 0 run tp @s @r[team=Team1,tag=!dead]
execute as @s[team=Team2] if score TempIf TTL_Config matches 1 unless score TempMath TTL_Config matches 0 run tp @s @r[team=Team2,tag=!dead]
execute as @s[team=Team3] if score TempIf TTL_Config matches 1 unless score TempMath TTL_Config matches 0 run tp @s @r[team=Team3,tag=!dead]
execute as @s[team=Team4] if score TempIf TTL_Config matches 1 unless score TempMath TTL_Config matches 0 run tp @s @r[team=Team4,tag=!dead]

# ... if not teammates remain, do not respawn, give "eliminated" tage
execute if score TempIf TTL_Config matches 1 if score TempMath TTL_Config matches 0 run tag @s give eliminated

###execute if score TempIf TTL_Config matches 1 if score TempMath TTL_Config matches 0 run scoreboard players remove @s TTL_Deaths 1
###execute if score TempIf TTL_Config matches 1 if score TempMath TTL_Config matches 0 run kill @s

# Put player into survival mode
execute if score TempIf TTL_Config matches 1 run gamemode survival @s

# Remove dead tag from player
execute if score TempIf TTL_Config matches 1 run tag @s remove dead

# Clear player's TimeDead
execute if score TempIf TTL_Config matches 1 run scoreboard players reset @s TTL_TimeDead