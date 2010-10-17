class CreatePlayerGames < ActiveRecord::Migration
  def self.up
    create_table :player_games do |t|
      t.integer :player_id
      t.integer :game_id
      t.integer :cards_played, :default => 3

      t.timestamps
    end

    add_index :player_games, [:player_id, :game_id], :unique => true

  end

  def self.down
    drop_table :player_games
  end
end
