# TTT Classic

## About The Project

This project is a "demake" of the popular Garry's Mod gamemode, **Trouble in Terrorist Town (TTT)**, faithfully recreated for the original Half-Life. Experience the suspense and social deduction of TTT with the classic look and feel of the GoldSrc engine.

This is not a direct port, but a re-imagining of the TTT experience within the limitations and nostalgic charm of Half-Life 1. The goal is to create a version of TTT that feels like it could have been a mod from the early 2000s.

## About the Author

TTT Classic was created by Crazydog - reach me on [Steam](http://steamcommunity.com/id/crazydog) or Discord (crazydog). Email me at gss.crazydog@gmail.com

## Gameplay

If you're new to Trouble in Terrorist Town, here's the basic idea:

* **Innocents:** The majority of players. Their goal is to identify and eliminate the Traitors.
* **Traitors:** A small, secret group of players. Their goal is to eliminate all the Innocent players.
* **Detectives:** A special type of Innocent player with access to special equipment to help them identify the Traitors.

This demake stays true to the core TTT formula of paranoia, deception, and deduction. Work together with your fellow players to figure out who you can trust, but be careful... a traitor's knife could be just around the corner.

## Features

* Classic TTT gameplay roles: Innocent, Traitor, and Detective.
* A faithful recreation of the TTT experience in the GoldSrc engine.
* A curated selection of weapons and equipment suitable for the Half-Life universe.
* Custom HUD elements for TTT-specific information.
* Support for custom maps designed for the TTT experience.

## Requirements

* A legitimate, up-to-date copy of Half-Life on Steam.

## Installation

1.  Download the latest release
2.  Extract the contents of the zip file to your Half-Life installation directory (e.g., `C:\Program Files (x86)\Steam\steamapps\common\Half-Life`). You should have a `ttt` folder in the `Half-Life` directory.
3.  Restart Steam.
4.  "TTT Classic" should now appear in your Steam library.

## How to Play

1.  Launch "TTT Classic" from your Steam library.
2.  Find a server from the "Find Servers" menu, or create your own.
3.  Join the game and wait for the round to start.
4.  You will be assigned a role. Do your best to help your team win!

## Mapping

See `docs/mapping.md` for info about creating maps for TTT Classic

See `docs/ent_menu.md` for info about adding entities to existing maps

## Server Configuration

See `server.cfg` which has all server variables listed and documented.

`items.cfg` can be used to configure what weapons/ammo/items are enabled on your
server. See that file for more info on how to use it.

### Admins
Add Steam IDs to admins.cfg to indicate a player is an admin.

## Admin / Server Commands
* `ttt_restartround` - Restarts the current round. Requires cheats if not an admin.
* `ttt_print_roles` - Prints all active players to the console and indicates their roles. Usage is logged to server console.
* `ttt_print_admins` - Prints all admins to the console.
* `ttt_print_adminreport` - Prints a report of all the events of the game so far to the console
* `ttt_print_damagelog` - Prints a report of who damaged and killed who in the current round.

## Debug / Testing commands
Square bracket `[]` parameters are optional.

### Server Console
* `sv_addbot [BOT_NAME]` - [CHEAT] - Adds a bot to the server. Bots do not currently do anything but take up space.
* `sv_setrole (slot) (roleId)` -  [CHEAT] - Sets the player in slot `slot` to the role with ID `roleId`. 0 = traitor, 1 = detective, 2 = innocent

### Client Console
* `ttt_quickslot (slot)` - Immediately switches to the weapon in the specified slot. If slot is your current weapon's slot, it will switch to the previously selected weapon. 
* `getpos` - Prints your current origin and angles to the console
* `setpos (x) (y) (z)` - [CHEAT] - Teleports you to the coordinates specified
* `ttt_noclip` - [CHEAT] - Enables noclip
* `ttt_debug_testhat` - [CHEAT] - Gives you a Detective hat
* `ttt_force_innocent` - [CHEAT] - Set your role to Innocent
* `ttt_force_traitor` - [CHEAT] - Set your role to Traitor
* `ttt_force_detective` - [CHEAT] - Set your role to Detective
* `ttt_cheat_credits` - [CHEAT] - Gives you 10 credits


### Client or Server Console
* `ttt_version` - Prints the current TTT Version to the console
* `ttt_debug_preventwin` - Set to "1" to prevent the round from ending for any reason.
* `ttt_debug_self_dna_scan` - Set to "1" to allow scanning your own DNA.

## Thanks

This project would not have been possible if not for standing on the shoulders of giants, including:

* [ReHLDS](https://github.com/rehlds/ReHLDS), for providing insight into how the Goldsrc engine works.
* [ReGameDLL_CS](https://github.com/rehlds/ReGameDLL_CS), for their decompilation of the Counter-Strike server DLL.
* [CS16Client](https://github.com/Velaron/cs16-client), for their decompilation of the Counter-Strike client DLL.
* [Chicken Fortress](https://www.moddb.com/mods/chicken-fortress-3) for their 9-blend studio model renderer.
* [TWHL](https://twhl.info/) and the [TWHL Discord](https://discord.gg/jEw8EqD) for all the answers to my weird questions.
* [Admer456](https://www.youtube.com/@Admer456) for their Half-Life modding videos which helped me get up and running, and their direct help on the TWHL Discord.
* [GoldSrcSaturdays](https://goldsrcsaturdays.com) for helping test the game.
* b1rd, for helping with modeling, skinning, and creating many maps.
* Bad King Urgrain for the original TTT Game mode and lots of image assets.
* [TTT for AMX Mod X](https://forums.alliedmods.net/showthread.php?t=238780), for the cellphone model (and inspiration to start this project).
* [The Trap](https://www.moddb.com/mods/the-trap) for the fully-modeled HEV Battery model.
* Icons by [famfamfam-silk](https://github.com/legacy-icons/famfamfam-silk)
* [Earth's Special Forces](https://www.esforces.com/), for the sphere model used by the Visualizer
* *[Overfloater](https://twhl.info/vault/view/7006), for the weather effects

## Map Credits
* ttt_747 - out4vio
* ttt_brained_rc3 - b1rd
* ttt_clubhouse - out4vio
* ttt_junkbaby - b1rd
* ttt_lighthouse - b1rd
* ttt_neighbours - b1rd (Ported from Gang Wars, original by Rebel Without A Pause)
* ttt_nonatulus - Pesce
* ttt_pinned - b1rd
* ttt_redlight - out4vio
* ttt_shhh - b1rd
* ttt_wreaked - b1rd