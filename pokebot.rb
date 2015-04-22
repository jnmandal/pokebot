require 'java'

java_import 'java.awt.event.KeyEvent'
java_import 'java.awt.Robot'
java_import 'java.awt.Rectangle'
java_import 'javax.imageio.ImageIO'
java_import 'java.io.File'
java_import 'java.awt.Toolkit'

# monkeypatching string class to convert strings back to booleans
class String
  def to_bool
    return true if self =~ (/^(true|t|yes|y|1)$/i)
    return false if self.empty? || self =~ (/^(false|f|no|n|0)$/i)
    raise ArgumentError.new "invalid value: #{self}"
  end
end

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
    self.simulate_key(KeyEvent::VK_F3, 0.5)
    sleep(0.2)
    self.simulate_key(KeyEvent::VK_X, 0.5)
    sleep(0.2)
  end
  def robo_screenshot
    # currently only working in full screen
    toolkit = Toolkit::getDefaultToolkit()
    screen_size = toolkit.getScreenSize()
    img = self.createScreenCapture(Rectangle.new(screen_size))
    outputfile = File.new("screenshot.png")
    outputfile.delete if outputfile.exists
    ImageIO.write(img, "png", outputfile)
  end
  def poke_screenshot
    # assumes screenshot button is set to left bracket
    self.simulate_key(KeyEvent::VK_OPEN_BRACKET, 0.5)
    sleep(0.2)
  end
  def in_battle?
    test = `ruby ocr_script.rb screenshot.png appeared`
    puts "in_battle?: #{test}"
    return test.to_bool
  end
  def hunt_for_pokemon
    battle_status = false
    until battle_status
      left_right
      robo_screenshot
      battle_status = in_battle?
    end
  end
end