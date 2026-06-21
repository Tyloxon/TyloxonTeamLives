# Some basic maths <3
scoreboard players set TempIf TTL_Config 20
scoreboard players operation TempMath TTL_Config = @s TTL_TimeDead
scoreboard players operation TempMath TTL_Config /= TempIf TTL_Config

# Show actionbar above hotbar
execute if score @s TTL_TimeDead matches ..1 run title @s times 0t 10t 0t
execute if score @s TTL_TimeDead < RespawnWaitTime TTL_Config run title @s actionbar [{"text":"You have been dead for ","color":"red"},{"score":{"name":"TempMath","objective":"TTL_Config"}},{"text":"s"}]
execute if score @s TTL_TimeDead >= RespawnWaitTime TTL_Config run title @s actionbar [{"text":"You have been dead for ","color":"green"},{"score":{"name":"TempMath","objective":"TTL_Config"}},{"text":"s "},{"text":"-> Teammates can respawn you with '/trigger RespawnTeam'","color":"gray"}]
execute if score @s TTL_TimeDead >= RespawnTimeout TTL_Config run title @s clear
