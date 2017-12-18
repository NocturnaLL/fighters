require 'observer'

class Gladiator
  include Observable
  attr_accessor :health, :event
  attr_reader :speed, :strength, :intelligence

  def initialize(speed,strength,intelligence,health)
    @event = false
    @audiences = []
    @speed=speed
    @strength=strength
    @intelligence=intelligence
    @health=health
    @user_total = speed + strength + intelligence + health

    unless (@user_total == 20)
      puts "Invalid Gladiator attributes, creating random Gladiator.."
      @total_attr = 20
      initAttr()
    end
  end

  def initAttr
    @speed = rand(1..6)
    @total_attr = @total_attr - @speed
    @strength = rand(1..5)
    @total_attr = @total_attr - @strength
    @intelligence = rand (1..6)
    @total_attr = @total_attr - @intelligence
    @health = @total_attr
  end

  def register(audience)
    changed
    @audiences.push(audience)
    puts "Audience took a seat in the arena."
  end

  def notify
    @audiences.each do |a|
      a.update(@health,@event)
    end
    
 end

  def deregister(audience)
    changed
    @audiences.delete(audience)
    puts "Audience left the arena."
  end

  def winEvent()
    @event = true
  end

  def loseEvent()
    @event = false
  end

  def printAttr
    puts "Speed: #{@speed} "
    puts "Strength: #{@strength} "
    puts "Intelligence: #{@intelligence} "
    puts "Health: #{@health} "
  end
end
