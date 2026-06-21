# Some basic maths <3
scoreboard players set TempIf TTL_Config 20
scoreboard players operation TempMath TTL_Config = RespawnActionTime TTL_Config
scoreboard players operation TempMath TTL_Config -= @s TTL_RespawnDelay
scoreboard players operation TempMath TTL_Config /= TempIf TTL_Config
scoreboard players add TempMath TTL_Config 1

# Show title in centre of screen (no fade)
execute if score @s TTL_RespawnDelay matches ..1 run title @s times 0t 10t 0t
execute if score @s TTL_RespawnDelay < RespawnActionTime TTL_Config run title @s subtitle [{"text":"Get ready to spawn on one of your teammates! ","color":"gray"}]
execute if score @s TTL_RespawnDelay < RespawnActionTime TTL_Config run title @s title [{"text":"Respawning in ","color":"green"},{"score":{"name":"TempMath","objective":"TTL_Config"}},{"text":"s..."}]
execute if score @s TTL_RespawnDelay >= RespawnActionTime TTL_Config run title @s clear