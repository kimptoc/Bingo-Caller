class CreateCalledNumbers < ActiveRecord::Migration
  def self.up
    create_table :called_numbers do |t|
      t.integer :game_id
      t.integer :called_ball
      t.timestamp :called_time

      t.timestamps
    end
  end

  def self.down
    drop_table :called_numbers
  end
end
