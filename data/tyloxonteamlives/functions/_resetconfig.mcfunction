function tyloxonteamlives:resetconfig

tellraw @s {"text":"The config for datapack TyloxonTeamLives has been reset!","color":"green"}

# Reset trigger
scoreboard players reset @s ResetConfig
scoreboard players enable @s ResetConfig