# Pokebot
A JRuby Robot that moves back and forth, notices when it's in a battle with a wild pokemon, and battles that pokemon. Great for level grinding!

#Dependencies
This depends pretty heavily on ![rTesseract](https://github.com/dannnylo/rtesseract), which it uses to parse text form a screenshotted image and determine whether or not you are in a battle, setup for it is as follows:
   
    gem install rtesseract

    gem install quick_magick
   
   
(Note: other rmagick gems will work, this is just the one the script we wrote uses)

You will also need to install the two dependency libraries for rTesseract to work, Tesseract and ImageMagick

####On Mac
    brew install tesseract

    brew install imagemagick
