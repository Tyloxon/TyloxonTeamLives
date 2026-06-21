tellraw @s {"text":"The current team lives:","bold":true,"color":"green"}

tellraw @s [{"text":"  Team 1 - ","color":"green"},{"score":{"name":"Team1","objective":"TTL_TeamLives"}},{"text":" lives"}]
tellraw @s [{"text":"  Team 2 - ","color":"green"},{"score":{"name":"Team2","objective":"TTL_TeamLives"}},{"text":" lives"}]
tellraw @s [{"text":"  Team 3 - ","color":"green"},{"score":{"name":"Team3","objective":"TTL_TeamLives"}},{"text":" lives"}]
tellraw @s [{"text":"  Team 4 - ","color":"green"},{"score":{"name":"Team4","objective":"TTL_TeamLives"}},{"text":" lives"}]

# Reset trigger
scoreboard players reset @s ShowTeamLives
scoreboard players enable @s ShowTeamLives