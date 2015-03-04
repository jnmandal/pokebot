# Pokebot
A JRuby Robot that moves back and forth, notices when it's in a battle with a wild pokemon, and battles that pokemon. Great for level grinding! This was created for use with Pokemmo using their built in screenshot feature, so the first thing you want to do upon downloading this is set the screenshot key in the options to [. Then if you execute the script and set the pokemmo window to the current window you will see your avatar moving back and forth, be sure to place yourself in an area with lots of grass (caves actually work best for this). The script will run until you tell it to stop and level up your pokemon!

#Dependencies
This depends pretty heavily on [rTesseract](https://github.com/dannnylo/rtesseract), which it uses to parse text form a screenshotted image and determine whether or not you are in a battle, setup for it is as follows:
   
    gem install rtesseract

    gem install quick_magick
   
   
(Note: other rmagick gems will work, this is just the one the script we wrote uses)

You will also need to install the two dependency libraries for rTesseract to work, Tesseract and ImageMagick

####On Mac
    brew install tesseract

    brew install imagemagick
