class Game < ActiveRecord::Base
  has_many :called_numbers
  has_many :players
  belongs_to :caller
  belongs_to :bingo_session

  def has_been_called? ball
#    puts "Checking "+ball.to_s
    called_numbers.each { | c|
#      puts "Called ball "+c.called_ball.to_s
      if c.called_ball == ball
        return true
      end
    }
    return false;
  end

  def next_ball
    range = max_balls - called_numbers.length
    if range <= 0
      puts "All numbers have been called..."
      return
    end
    next_ball_pos = 1+rand(range-1)
#    puts "Next ball pos "+next_ball_pos.to_s
    current_pos = 0
    (1..next_ball_pos).each { | p |
      current_pos += 1
      while has_been_called? current_pos
        current_pos += 1
      end
    }
    next_ball = CalledNumber.new(:called_ball => current_pos, :game_id => id, :called_time => Time.now)
    next_ball.save!
    called_numbers << next_ball
    return next_ball
  end

  def last_ball_called
    last_ball = called_numbers.last
    return last_ball.called_ball unless last_ball == nil
    return ""
  end
end
