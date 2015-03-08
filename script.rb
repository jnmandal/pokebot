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
    while true
      self.simulate_key(KeyEvent::VK_LEFT, 0.5)
      sleep(0.2)
      self.simulate_key(KeyEvent::VK_RIGHT, 0.5)
      sleep(0.2)
    end
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
end

# require 'tesseract'

# e = Tesseract::Engine.new {|e|
#   e.language  = :eng
#   e.blacklist = '|'
# }

# e.text_for('test/first.png').strip # => 'ABC'
