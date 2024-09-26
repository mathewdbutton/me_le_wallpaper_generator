Mass Effect Random Wallpaper Generator
===========================================================

This hacked together script uses the assets from the [My Shepard Art Creator](https://www.ea.com/games/mass-effect/mass-effect-legendary-edition/my-shepard-art-creator) site to randomly generate wallpapers with different arrangements of the characters from Mass Effect.

## How do I run this?

After installing the gemfile dependecies, run `ruby runner.rb generate` which will generate a file in the project directory called "mass-effect-wallpaper.png".

I then run this command through a cron job that executes every minute, overriding the "mass-effect-wallpaper.png" file

Lastely I point my wallpaper manager (the default for ubuntu) at this file and it handles the transition as the file changes

**I told you it was hacked together**

## DISCLAIMER

Mass Effect is a trademark of ELECTRONIC ARTS INC.  
Visual assets used in this generator are the sole property of ELECTRONIC ARTS INC.

This project is fan-made and is not managed by ELECTRONIC ARTS INC.