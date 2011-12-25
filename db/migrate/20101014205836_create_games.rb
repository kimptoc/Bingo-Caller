class CreateGames < ActiveRecord::Migration
  def self.up
    create_table :games do |t|
      t.integer :max_balls, :default => 90
      t.integer :bingo_session_id
      t.integer :player_with_first_line_id
      t.integer :player_with_bingo_id
      t.integer :secs_between_calls, :default => 6
      t.integer :game_number, :default => 1
      
      t.timestamps
    end
  end

  def self.down
    drop_table :games
  end
end
