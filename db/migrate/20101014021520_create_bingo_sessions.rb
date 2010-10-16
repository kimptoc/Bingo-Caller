class CreateBingoSessions < ActiveRecord::Migration
  def self.up
    create_table :bingo_sessions do |t|
      t.decimal :cost_per_card  , :default => 0.1
      t.decimal :line_prize_percent   , :default => 0.3
      t.decimal :house_prize_percent , :default => 0.7
      t.string :session_name
      t.boolean :is_public, :default => false

      t.timestamps
    end
  end

  def self.down
    drop_table :bingo_sessions
  end
end
