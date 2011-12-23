class PlayerGame < ActiveRecord::Base
  belongs_to :player
  belongs_to :game

  validates :player, :game, presence: true
end
