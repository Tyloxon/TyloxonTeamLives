# Load message
tellraw @a {"text":"[TyloxonTeamLives] Loaded for mc 1.20.1","color":"green"}

# Config for the datapack
scoreboard objectives add TTL_Config dummy
execute unless score LoadedOnce TTL_Config matches 1 run function tyloxonteamlives:resetconfig
execute unless score LoadedOnce TTL_Config matches 1 run scoreboard players set LoadedOnce TTL_Config 1

# Teams, set their colours here
team add Team1
team modify Team1 color gold
team add Team2
team modify Team2 color green
team add Team3
team modify Team3 color red
team add Team4
team modify Team4 color blue

# Initialise scoreboards
scoreboard objectives add TTL_ReadyPlayers dummy
scoreboard objectives add TTL_Admins dummy
scoreboard objectives add TTL_DeadTime dummy
scoreboard objectives add TTL_TeamLives dummy

# Death tracking scoreboards
scoreboard objectives add TTL_Deaths dummy
scoreboard objectives add TTL_PrevDeaths dummy

# Register global triggers
scoreboard objectives add RespawnTeam trigger
scoreboard objectives add JoinTeam trigger

# Register admin triggers
scoreboard objectives add ResetConfig trigger
scoreboard objectives add ResetLives trigger
scoreboard objectives add ShowTeamLives trigger
scoreboard objectives add BroadcastTeamLives trigger

# Set loaded once
scoreboard players set LoadedOnce TTL_Config 1