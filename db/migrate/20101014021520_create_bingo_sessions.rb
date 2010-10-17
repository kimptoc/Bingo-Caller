class CreateBingoSessions < ActiveRecord::Migration
  def self.up
    create_table :bingo_sessions do |t|
      t.decimal :cost_per_card  , :default => 0.1
      t.decimal :line_prize_per_card, :default => 0.03
      t.decimal :bingo_prize_per_card, :default => 0.07
      t.string :session_name
      t.boolean :is_public, :default => false
      t.integer :caller_id

      t.timestamps
    end
  end

  def self.down
    drop_table :bingo_sessions
  end
end
