require 'rtesseract'

p image = RTesseract.new("test.png", :processor => "quick_magick", :lang => "eng")
p image.to_s.include?("appeared")