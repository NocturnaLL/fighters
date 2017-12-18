class Strategy
  def response(previous_health,health,event,r)
    r.responseAudience(previous_health,health,event)
  end
end

class Negative
  def responseAudience(previous_health,health,event)
    if (health<previous_health)
      puts "Health reduces, negative audience : CHEERS"
    end
    if (event)
      puts "Event won, negative audience: BOOOS"

    elsif (!event)
      puts "Event lost, negative audience: CHEERS"
    end
  end
end

class Positive
  def responseAudience(previous_health,health,event)
    if (health<previous_health)
      puts "Health reduces, positive audience : BOOOS"
    end
    if (event)
      puts "Event won, positive audience: CHEERS"

    elsif (!event)
      puts "Event lost, positive audience: BOOOS"
    end
  end
end

class Careless
  def responseAudience(previous_health,health,event)
    if (health<previous_health )
      puts "Health reduces, careless audience : WHAT EVER"
    end
    
    if (event)
      puts "Event won, careless audience: OK"

    elsif (!event)
      puts "Event lost, careless audience: HMMMM"
    end
  end
end
