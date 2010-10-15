class CreateGames < ActiveRecord::Migration
  def self.up
    create_table :games do |t|
      t.integer :max_balls
      t.integer :caller_id
      t.bool :is_public
      t.integer :player_with_first_line
      t.integer :player_with_house
      
      t.timestamps
    end
  end

  def self.down
    drop_table :games
  end
end
