require File.expand_path('../gladiator.rb', __FILE__)
require File.expand_path('../audience.rb', __FILE__)
class Arena
  def initialize
    raise NotImplementedError
  end

  def templateMethod(gladiator)
    if gladiator.health>0
      intelligenceBattle(gladiator)
      gladiator.notify()
    end
    if gladiator.health>0
      speedBattle(gladiator)
      gladiator.notify()
    end
    if gladiator.health>0
      strengthBattle(gladiator)
      gladiator.notify()
    end
  end

  def intelligenceBattle(gladiator)
    raise NotImplementedError
  end

  def speedBattle(gladiator)
    raise NotImplementedError
  end

  def strengthBattle(gladiator)
    raise NotImplementedError
  end
end

class StarWars < Arena
  def initialize
    @int_weapon = 0
    @speed_weapon = 0
    @strength_weapon = 0
    @user_answer = ""
  end

  def intelligenceBattle(gladiator)
    random = rand(1..2)
    @question1 = "The Empire started out in the brain of a Sith Lord, who went
    by the name Palpatine. He was called the Emperor in the original three
    episodes. What was the proper name of this Sith?"
    @q1_hints = ["First letter is d","Second letter is a","Third letter is r",
    "Fourth letter is t"]
    @q1_answer = "darth sidious"

    @question2 = " Throughout the prequel trilogy, Anakin Skywalker is called
    a two-word title in reference to the Jedi prophesy that he would bring
     balance to the force. What is this title?"
    @q2_hints = ["First letter is c", "Second letter is h", "Third letter is o", "Fourth letter is s"]
    @q2_answer = "chosen one"


    if (gladiator.intelligence== 2)
      @int_weapon = 1
    elsif (gladiator.intelligence == 3)
      @int_weapon = 2
    elsif (gladiator.intelligence == 4)
      @int_weapon = 3
    elsif (gladiator.intelligence > 4)
      @int_weapon = 4
    end

    if (random == 1)
      puts @question1
      puts "Enter --tips-- to see tips."

      @user_answer = gets.chop
      while (@user_answer!= @q1_answer && gladiator.health>0 )
        puts "Gladiator health: #{gladiator.health}"
        if(@user_answer == "tips")
          if gladiator.intelligence<2
            puts "Gladiators intelligence is too low, no tips for him."
          end
          printTips(@q1_hints,@int_weapon)
        elsif(@user_answer == @q1_answer)
          puts "Gladiator won."
          gladiator.winEvent()
        elsif(gladiator.health ==0)
          gladiator.loseEvent()
          puts "Gladiator is dead"
        end
        gladiator.health = gladiator.health - 1

        @user_answer = gets.chop
      end

      if(@user_answer == @q1_answer)
        puts "Gladiator won."
        gladiator.winEvent()


      elsif(gladiator.health ==0)
        puts "Gladiator is dead"
        gladiator.loseEvent()

      end

    elsif (random == 2)
      puts @question2
      puts "Enter --tips-- to see tips."

      @user_answer = gets.chop
      while (@user_answer!= @q2_answer && gladiator.health>0 )
        puts "Gladiator health: #{gladiator.health}"
        if(@user_answer == "tips")
          if gladiator.intelligence<2
            puts "Gladiators intelligence is too low, no tips for him."
          end
          printTips(@q2_hints,@int_weapon)
        elsif(@user_answer == @q2_answer)
          puts "Gladiator won."
          gladiator.winEvent()
        elsif(gladiator.health ==0)
          puts "Gladiator is dead"
          gladiator.loseEvent()
        end
        gladiator.health = gladiator.health - 1

        @user_answer = gets.chop
      end

      if(@user_answer == @q2_answer)
        puts "Gladiator won."
        gladiator.winEvent()

      elsif(gladiator.health ==0)
        puts "Gladiator is dead..."
        gladiator.loseEvent()

      end

    end



  end

  def printTips(arr,weapon)
    i = 0
    while (i<weapon)
      puts arr[i]
      i = i+1
    end
  end

  def speedBattle(gladiator)
    if (gladiator.speed== 2)
      @speed_weapon = 1
    elsif (gladiator.speed == 3)
      @speed_weapon = 2
    elsif (gladiator.speed == 4)
      @speed_weapon = 3
    elsif (gladiator.speed > 4)
      @speed_weapon = 4
    end
    answer = "The Force will be with you. Always."
    time_to_finish = 4*@speed_weapon + gladiator.health
    puts "--------------------------------------------------------------------"
    puts "In this event gladiators should type the quote in specific time."
    puts "Press enter to see the quote..."
    @user_answer = gets.chop
    puts "The Force will be with you. Always."
    puts ""
    puts "You have #{time_to_finish} seconds to finish the test."
    puts "Press a key to start the timer..."
    @user_answer = gets.chop
    puts "Started..."
    t1 = Time.now
    @user_answer = gets.chop
    t2 = Time.now
    puts "Done..."
    delta = t2 - t1 # in seconds
    puts "You have answered the question in #{delta} seconds..."
    if(delta>time_to_finish)
      puts "Too slow."
    end
    if (@user_answer == answer)
      puts "Conguratulations, you passed the test..."
      gladiator.winEvent()
    else
      gladiator.health = 0
      gladiator.loseEvent()
      puts "Wrong answer"
      puts "Gladiator is dead..."

    end

  end

  def strengthBattle(gladiator)
    if (gladiator.strength== 2)
      @int_weapon = 1
    elsif (gladiator.strength == 3)
      @int_weapon = 2
    elsif (gladiator.strength == 4)
      @int_weapon = 3
    elsif (gladiator.strength > 4)
      @int_weapon = 4
    end

    score_to_pass = (80/@int_weapon)-gladiator.health
    puts "--------------------------------------------------------------------"
    puts "In this test the gladiator must show his true strength."
    puts "To pass the test the gladiator should enter at least enter specific
    amount of character on keyboard in specific time"
    puts ""
    puts "Gladiator should pass score of #{score_to_pass}"
    puts "May the force be with you..."
    puts "Press a key to start the timer..."
    @user_answer = gets.chop
    puts "Started..."
    t1 = Time.now
    @user_answer = gets.chop
    t2 = Time.now
    puts "Done..."
    delta = t2 - t1 # in seconds
    puts "You have entered #{@user_answer.length} characters in #{delta} seconds"
    score = @user_answer.length/delta
    puts "Gladiator's score is #{score} "
    if(score>= score_to_pass)
      gladiator.winEvent()
      puts "Conguratulations, you passed the test..."
    else
      gladiator.health = 0
      gladiator.loseEvent()
      puts "You are so weak."
      puts "Gladiator is dead..."
    end
  end
end


class Pirates < Arena
  def initialize
    @int_weapon = 0
    @user_answer = ""
    @speed_weapon = 0
    @strength_weapon = 0
  end

  def intelligenceBattle(gladiator)
    random = rand(1..2)
    @question1 = "One of the most desired things in the world is to remain young
     forever (or simply be immortal). What if someone could have both? That's
     what everyone was after in On Stranger Tides. Each person sought the
     Fountain for different reasons, however. While Jack
     Sparrow wanted to drink from the Fountain to remain a pirate forever,
     Angelica wanted to reach the Fountain so she could help her father,
     Captain Teach, aka Blackbeard, prevent his pre-destined death at the
     hands of a one-legged man."
    @q1_hints = ["First letter is t","Second letter is h","Third letter is e",
    "Fourth letter is f"]
    @q1_answer = "the fountain of youth"

    @question2 = " What is the name of the ship that Jack Sparrows favourite?"
    @q2_hints = ["First letter is b", "Second letter is l", "Third letter is a", "Fourth letter is c"]
    @q2_answer = "black pearl"
    if (gladiator.intelligence== 2)
      @int_weapon = 1
    elsif (gladiator.intelligence == 3)
      @int_weapon = 2
    elsif (gladiator.intelligence == 4)
      @int_weapon = 3
    elsif (gladiator.intelligence > 4)
      @int_weapon = 4
    end

    if (random == 1)
      puts "--------------------------------------------------------------------"
      puts @question1
      puts "Enter --tips-- to see tips."

      @user_answer = gets.chop
      while (@user_answer!= @q1_answer && gladiator.health>0 )
        puts "Gladiator health: #{gladiator.health}"
        if(@user_answer == "tips")
          if gladiator.intelligence<2
            puts "Gladiators intelligence is too low, no tips for him."
          end
          printTips(@q1_hints,@int_weapon)
        elsif(@user_answer == @q1_answer)
          puts "Gladiator won."
        elsif(gladiator.health ==0)
          puts "Gladiator is dead"
        end
        gladiator.health = gladiator.health - 1

        @user_answer = gets.chop
      end

      if(@user_answer == @q1_answer)
        puts "Gladiator won."
      elsif(gladiator.health ==0)
        puts "Gladiator is dead"
      end

    elsif (random == 2)
      puts "--------------------------------------------------------------------"
      puts @question2
      puts "Enter --tips-- to see tips."

      @user_answer = gets.chop
      while (@user_answer!= @q2_answer && gladiator.health>0 )
        puts "Gladiator health: #{gladiator.health}"
        if(@user_answer == "tips")
          if gladiator.intelligence<2
            puts "Gladiators intelligence is too low, no tips for him."
          end
          printTips(@q2_hints,@int_weapon)
        elsif(@user_answer == @q2_answer)
          puts "Gladiator won."
        elsif(gladiator.health ==0)
          puts "Gladiator is dead"
        end
        gladiator.health = gladiator.health - 1

        @user_answer = gets.chop
      end

      if(@user_answer == @q2_answer)
        puts "Gladiator won."
        gladiator.winEvent()
      elsif(gladiator.health ==0)
        gladiator.loseEvent()
        puts "Gladiator is dead"
      end

    end



  end

  def printTips(arr,weapon)
    i = 0
    while (i<weapon)
      puts arr[i]
      i = i+1
    end
  end

  def speedBattle(gladiator)
    if (gladiator.speed== 2)
      @speed_weapon = 1
    elsif (gladiator.speed == 3)
      @speed_weapon = 2
    elsif (gladiator.speed == 4)
      @speed_weapon = 3
    elsif (gladiator.speed > 4)
      @speed_weapon = 4
    end
    answer = "Gentlemen! You shall always remember this as the day that you almost caught Captain Jack Sparrow!"
    time_to_finish = 4*@speed_weapon + gladiator.health
    puts "--------------------------------------------------------------------"
    puts "In this event gladiators should type the quote in specific time."
    puts "Press enter to see the quote..."
    @user_answer = gets.chop
    puts "Gentlemen! You shall always remember this as the day that you almost caught Captain Jack Sparrow!"
    puts ""
    puts "You have #{time_to_finish} seconds to finish the test."
    puts "Press a key to start the timer..."
    @user_answer = gets.chop
    puts "Started..."
    t1 = Time.now
    @user_answer = gets.chop
    t2 = Time.now
    puts "Done..."
    delta = t2 - t1 # in seconds
    puts "You have answered the question in #{delta} seconds..."
    if(delta>time_to_finish)
      puts "Too slow."
    end
    if (@user_answer == answer)
      gladiator.winEvent()
      puts "Conguratulations, you passed the test..."
    else
      gladiator.health = 0
      gladiator.loseEvent()
      puts "Wrong answer"
      puts "Gladiator is dead..."
    end
  end

  def strengthBattle(gladiator)
    if (gladiator.strength== 2)
      @int_weapon = 1
    elsif (gladiator.strength == 3)
      @int_weapon = 2
    elsif (gladiator.strength == 4)
      @int_weapon = 3
    elsif (gladiator.strength > 4)
      @int_weapon = 4
    end

    score_to_pass = (80/@int_weapon)-gladiator.health
    puts "--------------------------------------------------------------------"
    puts "In this test the gladiator must show his true strength."
    puts "To pass the test the gladiator should enter at least enter specific
    amount of character on keyboard in specific time"
    puts ""
    puts "Gladiator should pass score of #{score_to_pass}"
    puts ""
    puts "Press a key to start the timer..."
    @user_answer = gets.chop
    puts "Started..."
    t1 = Time.now
    @user_answer = gets.chop
    t2 = Time.now
    puts "Done..."
    delta = t2 - t1 # in seconds
    puts "You have entered #{@user_answer.length} characters in #{delta} seconds"
    score = @user_answer.length/delta
    puts "Gladiator's score is #{score} "
    if(score>= score_to_pass)
      gladiator.winEvent()
      puts "Conguratulations, you passed the test..."
    else
      gladiator.loseEvent()
      gladiator.health = 0
      puts "You are so weak."
      puts "Gladiator is dead..."
    end
  end
end
