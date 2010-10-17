class BingoSession < ActiveRecord::Base
  has_many :games
  has_many :players
  belongs_to :caller
  
end
