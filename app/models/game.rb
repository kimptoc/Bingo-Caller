class Game < ActiveRecord::Base
  has_many :called_numbers
  belongs_to :bingo_session
  belongs_to :player_with_first_line, :class_name => "Player",  :foreign_key => "player_with_first_line_id"
  belongs_to :player_with_bingo, :class_name => "Player",  :foreign_key => "player_with_bingo_id"
  has_many :player_games


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
    next_ball_pos = 1+rand(range)
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

  def self.copy_game(game)
    new_game = Game.new
    new_game.max_balls = game.max_balls
    new_game.bingo_session = game.bingo_session
    new_game.game_number = game.game_number + 1
    new_game.save!
    game.player_games.each do |p|
      puts "adding pg"
      pg = PlayerGame.new
      pg.game = new_game
      pg.player = p.player
      pg.cards_played = p.cards_played
      pg.save!
      new_game.player_games << pg
    end
    new_game.save!
    
    return new_game
  end

  def last_ball_called
    last_ball = called_numbers.last
    return last_ball.called_ball unless last_ball == nil
    return ""
  end

  def winnings_for_line
    #number of players cards * cost of card * percent for line
    num_cards = 0
    player_games.each do |p|
      num_cards += p.cards_played
    end
    return num_cards * bingo_session.line_prize_per_card
  end

  def winnings_for_bingo
    #number of players cards * cost of card * percent for bingo
    num_cards = 0
    player_games.each do |p|
      num_cards += p.cards_played
    end
    return num_cards * bingo_session.bingo_prize_per_card
  end
end
