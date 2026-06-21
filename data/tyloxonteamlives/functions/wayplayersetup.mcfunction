# WILL RAISE ERROR IF WAY MOD ISN'T ON :3
# SHOULD STILL RUN FINE THOUGH :D

# Per-player way setup
way admin seeAll @s
way see outline true

# Set way colour
execute if score TempIf TTL_Config matches 1 run way color default lime
execute if score TempIf TTL_Config matches 2 run way color default light_blue
execute if score TempIf TTL_Config matches 3 run way color default red
execute if score TempIf TTL_Config matches 4 run way color default light_gray
