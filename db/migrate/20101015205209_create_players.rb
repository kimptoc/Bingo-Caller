class CreatePlayers < ActiveRecord::Migration
  def self.up
    create_table :players do |t|
      t.integer :bingo_session_id
      t.string :name
      t.integer :caller_id

      t.timestamps
    end
  end

  def self.down
    drop_table :players
  end
end
