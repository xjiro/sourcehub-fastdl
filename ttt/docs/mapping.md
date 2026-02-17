# TTT Mapping Guide

## General Requirements
-   **Player Spawns**: Maps must contain `info_player_deathmatch` entities. Ideally your map should have 32 spawns to fit the maximum number of players possible.

## Design Philosophy
-   **Balance**: Ensure the map is balanced and does not favor any specific role.
-   **Traitor Areas**: Consider including areas or traps that can only be used effectively by Traitors.
-   **Layout**: Avoid overly complex or confusing layouts. Ensure good player flow.
  
## Example Map
`ttt_warehouse` has been included as an example map to showcase the entities described below. The source is also available in the `maps` folder.

## Map-specific materials.txt

TTT Classic allows mappers to specify their own materials.txt file for their map. 

Simply make a file named `sound/maps/MAPNAME_materials.txt` and add your material definitions to it. See `sound/materials.txt` for how the file should be formatted.
This file will overwrite anything in the standard materials.txt. You do not need to redefine anything that you don't want to change.

See `sound/maps/cs_office_materials.txt` as an example.

Make sure to add the materials file to your map's res file.

IMPORTANT: There MUST be a blank line at the end of the file or the last material will NOT be loaded.

## TTT Entities

### `worldspawn`
Worldspawn is a built-in entity that contains global map settings. TTT has some custom properites you can set for your map:
-   `MaxVoiceRange`: The number of Hammer units that two players must be within to be able to hear each other or view each other's text chat. Note that servers can override this setting.
-   `MaxVoiceWallRange`: The maximum combined thickness of walls that voice or text chat can travel through. Two players separate by this much continous or disjoint brush thickness cannot hear each other or see each other's text chat. Note that servers can override this setting.
-   `RoundPreparation`: Fires when the Preparation phase of a round starts.
-   `RoundStart`: Fires when a round begins, meaning traitors have been selected.
-   `TraitorWin`: Fires when a round ends and traitors won.
-   `InnocentWin`: Fires when a round ends and innocents won.
-   `TimeRanOut`: Fires when a round ends because time ran out.
-   `author_steamid`: The SteamID of the map creator. This is used to highlight the creator's name in the scoreboard with a special color. For example, STEAM_0:0:11101.

### `ttt_item`
Spawns a specific weapon, ammo pack, or piece of equipment. Use the dropdown selector in Hammer to choose the specific item.
-   **item**: The item to be spawned.

### `ttt_random_weapon`
Spawns a random weapon from the available pool. Does not include purchasable weapons. Spawnflags let you configure what kinds of weapons are eligble to spawn.
-   **spawn_ammo**: The number of ammo boxes to spawn alongside the weapon. Default is 0.
-   **Spawnflags**:
    -   1: Sub-Machine Guns
    -   2: Assault Rifles
    -   4: Sniper Rifles
    -   8: Shotguns
    -   16: Light Machine Guns
    -   32: Standard Pistols
    -   64: Automatic Pistols
    -   128: Magnum Pistols
    -   256: Grenades

### `ttt_random_ammo`
Spawns one or more random ammo boxes.
-   **count**: The number of ammo boxes to spawn. Default is 1.

### `ttt_traitor_button`
An invisible button that can only be activated by Traitors.
-   **target**: The entity to trigger when the button is used.
-   **delay**: Time in seconds before the button can be used again. A negative value makes it a one-time use button. Default is 1.0.
-   **description**: Text shown on a Traitor's HUD when looking at the button. Default is "Activate".
-   **usable_range**: Maximum distance in Hammer units a Traitor can be to use the button. Default is 1024.

### `ttt_traitor_button_locker`
A point entity that can lock, unlock, or toggle the state of a `ttt_traitor_button` entity. Trigger this enttiy with a trigger_relay to activate it. On=unlock Off=lock, Toggle=toggle
-   **target**: The `targetname` of the `ttt_traitor_button` to affect.

### `ttt_credit_adjust`
A point entity that can be activated to give or take a specified number of equipment credits from a player. It fires different outputs depending on whether the transaction was successful. This works for any role with credits (Traitors and Detectives).
-   **credits**: The number of credits to attempt to subtract from the activating player. Set to negative to give credits.
-   **Outputs**:
    -   `OnSuccess`: Fired if the player has enough credits and they are successfully subtracted, or if credits were given.
    -   `OnFail`: Fired if the player does not have enough credits.

### `ttt_logic_role`
This entity is a conditional trigger that fires different outputs based on the role of the activating player. It can be used to create role-specific paths, buttons, or traps.

**Usage:**
Add a key with the name of the role you want to filter for (e.g., `traitor`, `detective`, `jester`) and set the value to `1`. You can add multiple role keys to allow multiple roles to pass.
-   **OnPass**: This target is fired if the activating player matches one of the specified roles.
-   **OnFail**: This target is fired if the activating player does not match any of the specified roles.

#### Building a Traitor Tester

This can be used to build a basic traitor tester in this way:
1. Create and configure a `ttt_logic_role`
2. Create a `multisource` - this will control if the tester is active
3. Create a `trigger_multiple` - set the `target` to the `ttt_logic_role` and the `master` to the `multisource`
4. Create a `trigger_relay` - set the `target` to the `multisource` and set the `triggerstate` to `toggle`
5. Create a `multi_manager` - activate the `trigger_relay` twice. One at `0` and again at `0.1`
6. Create a `func_button` - set the `target` to the `multi_manager`

How it works:
1. When the `func_button` is pressed, it will activate the `multi_manager`.
2. The `multi_manager` will activate the `trigger_relay`
3. The `trigger_relay` will activate the `multisource`
4. The `multisource` will activate the `trigger_multiple`
5. When a player activates the `trigger_multiple`, it will activate the `ttt_logic_role`, which will activate one of the outputs.
6. 0.1s later, the `multi_manager` will activate the `trigger_relay` again
7. The `trigger_relay` will activate the `multisource` again
8. The `multisource` will deactivate the `trigger_multiple`

### `ttt_damageowner`
Used to specify that a player is responsible for the damage and kills made by another entity, like a `trigger_hurt`. When a player activates this entity, they become the "owner" of the target entity's damage, which attributes points and karma correctly. The `On` input sets the activating player as the owner, and the `Off` input clears the owner.
-   **damager**: The name of the entity that will be dealing damage (e.g., the targetname of a `trigger_hurt`).
-   **killname**: The name used in the round report for the damage source. For example, if set to "the gas trap", the event log will read "'Player 1' was killed by 'Player 2' using 'the gas trap'."
-   
### `ttt_game_text`
An entity that displays a message in the top right message area.
-   **message**: The text content that will be displayed.
-   **color**: The color of the message, defined by three numbers for Red, Green, and Blue (e.g., "255 0 0" for red).
-   **receive**: Determines who will see the message. Options are: Activator only, All players, Detectives only, Traitors only, or All except traitors.

### `ttt_playermodel`
Configures the models for all players on the server. When triggered, it can either force every player to use a specific model or reset them to the default random selection.
-   **model**: The player model to force. This model MUST be in the `models/player` folder.
-   **topcolor**: The top color of the player model, if the model supports color mapping.
-   **bottomcolor**: The bottom color of the player model, if the model supports color mapping.
-   **action**: The action to perform when the entity is triggered.
    * **Set**: Applies the specified model and colors to all players.
    * **Reset to random**: Removes the forced model, resetting all players to a random default model.

### `ttt_weapon_check`
A logic entity that checks if the activating player is carrying a specific weapon or type of weapon. When triggered, it fires one of two outputs depending on the result.
See the traitor tester example for `ttt_logic_role` to see how this can be attached to a trigger.
-   **check_type**: The category of weapon to look for (Primary, Secondary, Traitor Equipment, Grenade, Any Non-Spawn, or a specific weapon class).
-   **weapon_class**: If `check_type` is set to "Specific Weapon Class", this field must contain the exact classname of the weapon (e.g., `weapon_deagle`).
-   **target_found**: The target to fire if the activating player has the specified weapon.
-   **target_notfound**: The target to fire if the activating player does not have the specified weapon.

### `ttt_win`
A point entity that allows the map to force a win for either the Traitors or the Innocents. This entity has two modes of operation based on how it is triggered.
Will only fire if the round is active.
-   **To trigger a Traitor win**: Fire the `ttt_win` entity's `targetname` with a "Turn On" or "Toggle" signal.
-   **To trigger an Innocent win**: Fire the `ttt_win` entity's `targetname` with a "Turn Off" signal.

You can use entities like `trigger_relay` or `func_button` to send these specific signals.

### `ttt_chicken_spawn`
A point entity where spectators can spawn as a chicken. If none are added to a map, they will be automatically created from spawnpoints.
-   **Note**: The entity will automatically place itself on the ground below it.

### `env_weather`
A point entity that adds weather effects to a map
-   `**fallsprite**`: Path to the sprite to use for the falling weather effect.
-   `**impactsprite**`: Path to the sprite to use for the impact effect on the ground.
-   `type`: Type of weather affect. Changes the particle behavior
-   `windx`: Wind level on the x-axis
-   `minwindx`: Minimum wind level on the x-axis
-   `windy`: Wind level on the y-axis
-   `minwindy`: Minimum wind level on the y-axis
-   `freuqnecy`: How many particles to draw per second. Recommended to stay between 1000 and 3000

### `env_fog`
Controls client-side fog settings. This entity can be triggered to apply its settings to players.
-   **Start Distance**: The distance in units from the player where the fog effect begins.
-   **End Distance**: The distance in units from the player where the fog becomes fully opaque. This value also limits the maximum visibility distance for monsters.
-   **Fog Color (R G B)**: The color of the fog, specified as three Red, Green, and Blue values.
-   **Blend time**: The time in seconds it takes to transition from the old fog settings to the new ones when this entity is triggered.
-   **Start On (Flag)**: If checked, this fog configuration is applied to all players when the map loads.
-   **Role Support**: You can create role-specific fog settings by adding keys in the format `<rolename>_startdist` and `<rolename>_enddist`.
    -   Example: `traitor_startdist` set to `200` will override the start distance for Traitors.
    -   Example: `detective_enddist` set to `1000` will override the end distance for Detectives.


**Multiplayer Note:**
-   This entity is not tracked per-client. For multiplayer maps, you should **only use one `env_fog` entity** with the "Start On" flag checked. Dynamic fog (turning fog on/off or blending between different fog entities) will not work correctly and should not be used.

### `ttt_random`
A point entity that, when triggered, randomly selects one of its targets to fire based on a weighted probability. This is useful for creating random events.

It functions like a `multi_manager`, but instead of firing all targets on a timeline, it fires just one. You define targets and their weights by adding new key/value pairs to the entity in Hammer.

-   **Key/Value Pairs**: Add properties where the "key" is the `targetname` of an entity you want to trigger, and the "value" is its weight (a number from 0.0 to 1.0).
-   **Weights**: All weights should be positive numbers. For correct probability, **all weights should add up to 1.0**. If they do not, a warning will be printed in the server console.
-   **delay**: Time in seconds to wait before firing the randomly selected target.
-   **Spawnflags**:
    -   `1: Fire Once`: The entity will fire one time and then disable itself.

**Example:**
To make an entity that has a 25% chance to fire `event_a` and a 75% chance to fire `event_b`, you would add two properties to your `ttt_random` entity:
-   `event_a` : `0.25`
-   `event_b` : `0.75`

### `trigger_remove`
A trigger entity that instantly removes specific entities that touch it. This is useful for cleaning up areas or preventing item accumulation in specific zones.

**Entities Removed:**
-   **Corpses**: Dead player bodies (`ttt_corpse`).
-   **Weapon Bundles**: Dropped weapons and ammo boxes (`weaponbox`).
-   **Loose Weapons**: Any entity starting with `weapon_` (e.g., `weapon_m16`, `weapon_knife`).
-   **Loose Ammo/Items**: Any entity starting with `item_` or `ammo_` (e.g., `item_battery`, `ammo_9mm`).

**Note:**
-   This trigger **does not** remove living players.
-   Removal is instant upon touch.

### `trigger_jump`
A brush entity that launches players towards a target entity. Works just like the ones in Ricochet.
-   **target**: The name of the entity to launch the player towards (e.g. an `info_target`).
-   **height**: The height of the jump arc. Default is 128.