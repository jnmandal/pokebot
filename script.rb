require 'java'
# require 'rtesseract'

java_import 'java.awt.event.KeyEvent'
java_import 'java.awt.Robot'
java_import 'java.awt.Rectangle'
java_import 'javax.imageio.ImageIO'
java_import 'java.io.File'

class Pokebot < Robot
  def simulate_key(ev, delay=nil)
    key_press(ev)
    sleep(delay) if delay
    key_release(ev)
  end
  def left_right
    self.simulate_key(KeyEvent::VK_LEFT, 0.5)
    sleep(0.2)
    self.simulate_key(KeyEvent::VK_RIGHT, 0.5)
    sleep(0.2)
  end
  def fish
    while true
      self.simulate_key(KeyEvent::VK_F3, 0.5)
      sleep(0.2)
      self.simulate_key(KeyEvent::VK_X, 0.5)
      sleep(0.2)
    end
  end
  def robo_screenshot
    # currently not working
    capture = r.createScreenCapture(r.screenRect)
    outputfile = File.new("screenshot.png")
    outputfile.delete if outputfile.exists
    ImageIO.write(capture, "png", outputfile)
  end
  def poke_screenshot
    # assumes screenshot button is set to left bracket
    self.simulate_key(VK_OPEN_BRACKET, 0.5)
    sleep(0.2)
  end
  def battle
    self.simulate_key(KeyEvent::VK_X, 0.5)
    sleep(0.2)
    self.simulate_key(KeyEvent::VK_X, 0.5)
    sleep(0.2)
    self.poke_screenshot
    #Send it to the OCR to check if the pokemon has fainted
  end
end

trainer = Pokebot.new

while true
  #Move Left then Right
  trainer.left_right
  #Take a screenshot
  trainer.poke_screenshot
  #Send the screenshot to tesseract
  #If response is 1 then enter battle
  trainer.battle
  #If response is 0 then repeat
end
