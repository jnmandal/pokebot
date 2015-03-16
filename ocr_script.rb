require_relative 'pokereader.rb'

pokereader = Pokereader.new(ARGV[0])

if ARGV[1] == "appeared"
  puts pokereader.in_battle?
elsif ARGV[1] == "include"
  puts pokereader.include?(ARGV[2])
else
  puts pokereader.text
end