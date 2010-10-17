class Player < ActiveRecord::Base
  belongs_to :bingo_session
  belongs_to :caller
end
