Public-Enemy v1.4 particle system config file documentation
  by Spin (spin@ironoak.de)
  (c)2004 - IronOak studios
---
Default values are in the brackets.
The faders are located in penemy/pe_faders.cfg

pps x (1)           // x = integer, spray x parts per secont

num x (0)           // x = integer or "dynamic", spray max x parts, if x == 0 the
                       particle system must be limited by maxlife, if x == dynamic the
                       amount is given by code.
               
spd x (1)           // x = float, particles move x units per second

spr x ()            // x = string, loads the sprite x and uses it as the particle
                       texture. Has to be set to a valid value. Ex: spr sprites/flame.spr   
                           
maskspr x ()        // same as spr, but used as the sprite mask, brighter areas in the
                       mask sprite will result in a more intense sprite color. Only used
                       if mode is detailed
               
detailspr x ()      // same as spr, but used as a detail texture rendered on top of the
                       sprite. Only used if mode is detailed
               
size x y (1 1)      // x, y = float, defines the x and y size of one particle in units

side x y z (0 0 0)  // x, y, z = float, defines the deviation range on the given axis
                       of the particle direction
               
maxlife x (0)       // x = integer or "dynamic", sets the max life time in seconds for
                       the whole particle system. if x == 0 the particle system must be
                       limited by num, if x == dynamic the lifetime is given by
                       code.
               
partlife x (1)      // x = float, lifetime of a single particle

colfader x (blood)  // x = string, name of the fader used to fade the particle color

sizefader x (null)  // x = string, name of the fader used to fade the particle size

mode x (transadd)   // x = string, mode can be normal, detailed, transtex, glow, transalpha,
                       transadd. detailed will use the mask and detail sprite.
               
falloff x (none)    // x = string, sets the fall of function of the particles, can be none,
                       gravity, linear.
               
relative x (not)    // x = string, can be not, ent, att. If x == ent, the particle system
                       will be relative to an entity specified in the code, if x == att,
                       it will be relative to an attachment specified in the code.
               
clip x (false)      // x = boolean, if x == true the particles will be clipped against
                       walls/entitys
               
frames x (1)        // x = integer, number of frames in the sprite

fps x (1)           // x = integer, frames per second

calcangle x (false) // x = boolean, if x == true, the spray direction will be relative to
                       the angle of the entity specified in the code (if relative is set
                       to ent or att)