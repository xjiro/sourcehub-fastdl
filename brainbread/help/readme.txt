Public-Enemy v1.4 particle system config file documentation
  (c)2004 - IronOak studios
---
Default values are in the brackets.
The faders are located in penemy/pe_faders.cfg

blackbg x (true)       // x = boolean, if x == true the background of the box is
                          black.

borderx x (15)         // x = integer, width of the space between the text and the borders

bordery x (15)         // x = integer, height of the space between the text and the borders

font x (bluehighway)   // x = string, name of the font to use sprites/hud/"fontname".cfg/spr

start x (auto)         // x = string, defines from where the box should slide in, valid values:
                          none, left, right, top, bottom, auto(selects between top and bottom)

queue x (false)        // x = boolean, defines wheter to wait for the previous box to disappear

xpos x (0)             // x = integer or string, final screen-X position. Valid values:
                          center, left, right, p"percent", "X-value"

ypos x (0)             // x = integer or string, final screen-Y position. Valid values:
                          center, top, bottom, p"percent", "Y-value"

len x (0)              // x = float, duration of the box

delay x (0)            // x = float, wait x seconds before showing the box

sprite x ()            // x = string, sprite to display, can be empty

posfader x (position)  // x = string, name of the fader used to fade the position

sprfader x (stdspr)    // x = string, name of the fader used to fade the sprite color

txtfader x (stdtxt)    // x = string, name of the fader used to fade the text color

content {x ()          // x = string enclosed by {}, the Text to display
         .
         .
         .}

