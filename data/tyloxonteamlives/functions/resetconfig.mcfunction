# The number of lives each team starts with
scoreboard players set InitialTeamLives TTL_Config 6

# The time waited before a player can respawn
scoreboard players set RespawnWaitTime TTL_Config 200

# The timeout where the player is forced to respawn
scoreboard players set RespawnTimeout TTL_Config 500

# The time it takes for a player to finish respawning
scoreboard players set RespawnActionTime TTL_Config 100

# The maximum distance a spectator can go from their teammate
# CURRENTLY UNUSED
#scoreboard players set SpectatorMaxDistance TTL_Config 8

# Boolean whether to eliminate teams with no-one alive (disable for debugging)
scoreboard players set EliminateDeadTeams TTL_Config 1

# Temp values
scoreboard players set TempIf TTL_Config 0
scoreboard players set TempMath TTL_Config 0
scoreboard players set TempStatus TTL_Config 0
