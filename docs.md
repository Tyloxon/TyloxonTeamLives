### For Players
The number next to your name in the tab list is the number of lives your team has left.

Dead teammates can be respawned 10 seconds after they die (config RespawnWaitTime).
Dead teammates will be force respawned 30 seconds after they die (config RespawnTimeout).
Respawn dead teammates using `/trigger RespawnTeam`, which will take 5s to complete (config RespawnActionTime).

The number of lives your team has decreases when a player is respawned, NOT when they die.
If all players in a team are dead at the same time, the team is eliminated no matter how many lives they have left (if config EliminateDeadTeams is 1).

When spectating:
- You can go into the view of a teammate by left clicking on their body.
- You can fly up to 8 blocks away from a teammate before being teleported back to them.
- You can teleport to other teammates by pressing the `2` key twice, then selecting which teammate you want to go to.
- Please don't cheat by peaking through walls and telling your alive teammate where they

### Setup
1. After adding the datapack to the world, either restart or simply run `/reload`.
2. Add yourself as an admin using `/scoreboard players set @s TTL_Admins 1` (replace `@s` to make other players admin).
3. Change config as desired, refer to the "Config" section.
4. Execute as each player, join them to a team. For example `/execute as Tyloxon run trigger JoinTeam set 3` to join Tyloxon to team 3.
5. Tell players about the info in "For Players" so they know how it works :3 (feel free to condense lol)

### Config
You can view the config by setting the sidebar with `/scoreboard objectives setdisplay sidebar TTL_Config`.
This shows it to all players so hide it afterwards using `/scoreboard objectives setdisplay sidebar`.
You can change config using `/scoreboard players set <key> TTL_Config <value>`.

Config values:
- RespawnWaitTime - Ticks before a player can be respawned by a teammate
- RespawnTimeout - Ticks before a player is force respawned
- RespawnActionTime - Ticks taken to fully respawn a player
- InitialTeamLives - Starting lives of every team
- EliminateDeadTeams - Should teams be eliminated if all players are dead at the same time (1 or 0)

### General Commands
- `/trigger RespawnTeam` - Try respawn all dead (but not eliminated) players on you team.
- `/trigger TeamInfo` - See info about your team (num lives, num players, )

### Admin Commands
- `/trigger JoinTeam set <team_number>` - Join the player to the specified team (1-4).
- `/trigger LeaveTeam` - Make the player leave their current team.
- `/trigger GiveLife set <team_number>` - Increase the lives of the specified team (1-4) by one.
- `/trigger RemoveLife set <team_number>` - Decrease the lives of the specified team (1-4) by one.
- `/trigger ShowTeamLives` - Message only yourself with the number of lives each team has.
- `/trigger BroadcastTeamLives` - Message everyone with the number of lives each team has.
- `/trigger ResetConfig` - Reset to default config.
- `/trigger ResetLives` - Reset all teams to have the initial number of lives.
- `/trigger TTL_Reset` - Reset the state of the datapack, preserving admins and config (no this has no confirmation).
- `/trigger TTL_Cleanup` - Complete remove everything related to the datapack, must use `/reload` to "enable" the datapack again (no this has no confirmation).
