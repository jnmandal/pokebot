require 'rtesseract'

class Pokereader
  def initialize(filepath)
    @image = RTesseract.new(filepath, :processor => "quick_magick", :lang => "eng")
  end
  def in_battle?
    @image.to_s.include?("appeared")
  end
end



