require File.expand_path('../gladiator.rb', __FILE__)
require File.expand_path('../responses.rb', __FILE__)
class Audience
  def initialize(gladiator)
    @random = rand(1..3)
    @gladiator = gladiator
    @gladiator_health = gladiator.health
    @gladiator.add_observer(self)
  end

  def update(health,event)
    puts " Gladiators health was -> #{@gladiator_health} , now #{health}"
    s = Strategy.new
    setResponse(s,health,event)
    @gladiator_health = health
  end

  def setResponse(s,health,event)
    negativeAudience = Negative.new
    positiveAudience = Positive.new
    carelessAudience = Careless.new
    if (@random == 1)
      s.response(@gladiator_health,health,event,negativeAudience)
    elsif (@random == 2)
      s.response(@gladiator_health,health,event,positiveAudience)
    else (@random == 3)
      s.response(@gladiator_health,health,event,carelessAudience)
    end
  end
end
