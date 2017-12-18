require File.expand_path('../gladiator.rb', __FILE__)
require File.expand_path('../arena.rb', __FILE__)
require File.expand_path('../audience.rb', __FILE__)

def main()
  puts "You have 20 attributes remain..."
  puts "Enter speed attribute for gladiators"
  speed = gets.chop.to_i
  puts "You have #{20-speed} attributes remain..."
  puts "Enter strenght attribute for gladiators"
  strength = gets.chop.to_i
  puts "You have #{20-speed-strength} attributes remain..."
  puts "Enter intelligent attribute for gladiators"
  int = gets.chop.to_i
  puts "You have #{20-speed-strength-int} attributes remain..."
  puts "Enter health attribute for gladiators"
  health = gets.chop.to_i
  g = Gladiator.new(speed,strength,int,health)
  puts "Gladiator created..."
  puts "speed:#{g.speed}, strength:#{g.strength}, int: #{g.intelligence}, health: #{g.health}"
  puts "Enter an arena type, StarWars or Pirates"
  puts "s->StarWars, p->Pirates"
  arena_type = gets.chop
  s = StarWars.new
  i = Pirates.new
  a1 = Audience.new(g)
  a2 = Audience.new(g)
  a3 = Audience.new(g)
  a4 = Audience.new(g)
  a5 = Audience.new(g)
  a6 = Audience.new(g)
  a7 = Audience.new(g)
  a8 = Audience.new(g)
  a9 = Audience.new(g)
  a10 = Audience.new(g)
  g.register(a1)
  g.register(a2)
  g.register(a3)
  g.register(a4)
  g.register(a5)
  g.register(a6)
  g.register(a7)
  g.register(a8)
  g.register(a9)
  g.register(a10)
  if (arena_type == "s")
    s.templateMethod(g)
  elsif (arena_type == "p")
    i.templateMethod(g)
  else
    puts "Invalid arena type"
  end

  g.deregister(a1)
  g.deregister(a2)
  g.deregister(a3)
  g.deregister(a4)
  g.deregister(a5)
  g.deregister(a6)
  g.deregister(a7)
  g.deregister(a8)
  g.deregister(a9)
  g.deregister(a10)
end

main
