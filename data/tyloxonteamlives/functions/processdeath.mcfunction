# Get team's lives
# Add tag "dead"
# Set gamemode to spectator
# Set time dead to zero, it will start counting up

# Tag player as dead, set their TimeDead to 0, make them spectator
tag @s add dead
scoreboard players set @s TTL_TimeDead 0
gamemode spectator @s



# Update PrevDeaths
scoreboard players operation @s TTL_PrevDeaths = @s TTL_Deaths