class CreateGames < ActiveRecord::Migration
  def self.up
    create_table :games do |t|
      t.integer :max_balls, :default => 90
      t.integer :bingo_session_id
      t.integer :player_with_first_line
      t.integer :player_with_house
      t.integer :secs_between_calls, :default => 5
      
      t.timestamps
    end
  end

  def self.down
    drop_table :games
  end
end
