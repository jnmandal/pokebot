require 'rtesseract'

class Pokereader
  def initialize(filepath)
    @image = RTesseract.new(filepath, :processor => "quick_magick", :lang => "eng")
  end
  def include?(word)
    @image.to_s.include?(word)
  end
  def in_battle?
    @image.to_s.include?("appeared")
  end
  def text
    @image.to_s
  end
end