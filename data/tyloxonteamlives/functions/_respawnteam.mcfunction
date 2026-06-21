# Check that the caller is alive (fail=-1), has dead teammates, and has team lives to spare
scoreboard players set TempIf TTL_Config 0
execute if entity @s[team=Team1] if entity @a[team=Team1,tag=dead,tag=!eliminated,tag=!respawning,limit=1] if score Team1 TTL_TeamLives matches 1.. run scoreboard players set TempIf TTL_Config 1
execute if entity @s[team=Team2] if entity @a[team=Team2,tag=dead,tag=!eliminated,tag=!respawning,limit=1] if score Team2 TTL_TeamLives matches 1.. run scoreboard players set TempIf TTL_Config 2
execute if entity @s[team=Team3] if entity @a[team=Team3,tag=dead,tag=!eliminated,tag=!respawning,limit=1] if score Team3 TTL_TeamLives matches 1.. run scoreboard players set TempIf TTL_Config 3
execute if entity @s[team=Team4] if entity @a[team=Team4,tag=dead,tag=!eliminated,tag=!respawning,limit=1] if score Team4 TTL_TeamLives matches 1.. run scoreboard players set TempIf TTL_Config 4
execute if entity @s[tag=dead] run scoreboard players set TempIf TTL_Config -1

# Success message
execute if score TempIf TTL_Config matches 1.. run tellraw @s {"text":"[TTL-RespawnTeam] Trying to respawn 1+ teammates!","color":"green"}
# Fail messages
execute if score TempIf TTL_Config matches 0 run tellraw @s [{"text":"[TTL-RespawnTeam] No-one can be respawned! ","color":"red"},{"text":"(either no dead teammates or no team lives)","color":"gray"}]
execute if score TempIf TTL_Config matches -1 run tellraw @s {"text":"[TTL-RespawnTeam] You can't respawn others while dead! ","color":"red"}

# Set TimeDead of calling player to -1 so respawn functions know where to spawn the dead teammates
# CURRENTLY NOT A RELIABLE IMPLEMENTATION
execute if score TempIf TTL_Config matches 1.. run scoreboard players set @s TTL_TimeDead -1

# Attempt to revive all dead teammates
# TODO: Figure out how to respawn in Queue order (first dead is highest priority for respawning)
execute if score TempIf TTL_Config matches 1 as @a[team=Team1,tag=dead,tag=!eliminated,tag=!respawning] if score @s TTL_TimeDead >= RespawnWaitTime TTL_Config run function tyloxonteamlives:respawninit
execute if score TempIf TTL_Config matches 2 as @a[team=Team2,tag=dead,tag=!eliminated,tag=!respawning] if score @s TTL_TimeDead >= RespawnWaitTime TTL_Config run function tyloxonteamlives:respawninit
execute if score TempIf TTL_Config matches 3 as @a[team=Team3,tag=dead,tag=!eliminated,tag=!respawning] if score @s TTL_TimeDead >= RespawnWaitTime TTL_Config run function tyloxonteamlives:respawninit
execute if score TempIf TTL_Config matches 4 as @a[team=Team4,tag=dead,tag=!eliminated,tag=!respawning] if score @s TTL_TimeDead >= RespawnWaitTime TTL_Config run function tyloxonteamlives:respawninit

# Reset trigger
scoreboard players reset @s RespawnTeam
scoreboard players enable @s RespawnTeam