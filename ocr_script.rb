require_relative 'pokereader.rb'

pokereader = Pokereader.new(ARGV[0])

if ARGV[1] == "appeared?"
  puts pokereader.in_battle?
end