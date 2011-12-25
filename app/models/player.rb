class Player < ActiveRecord::Base
  belongs_to :bingo_session
  belongs_to :caller
  has_many :player_games

  def to_s
    return name
  end

  def num_lines
    lines = 0
    player_games.each do |g|
      if g.game.player_with_first_line and g.game.player_with_first_line.id == id
        lines += 1
      end
    end
    return lines
  end

  def num_bingos
    bingos = 0
    player_games.each do |g|
      if g.game.player_with_bingo and g.game.player_with_bingo.id == id
        bingos += 1
      end
    end
    return bingos
  end

  def costs
    p_costs = 0
    player_games.each do |g|
      p_costs += g.cards_played * g.game.bingo_session.cost_per_card
    end
    return p_costs
  end

  def winnings
    p_winnings = 0
    player_games.each do |g|
      if g.game.player_with_first_line and g.game.player_with_first_line.id == id
        p_winnings += g.game.winnings_for_line
      end
      if g.game.player_with_bingo and g.game.player_with_bingo.id == id
        p_winnings += g.game.winnings_for_bingo
      end
    end
    return p_winnings
  end
end
