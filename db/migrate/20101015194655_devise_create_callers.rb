class DeviseCreateCallers < ActiveRecord::Migration
  def self.up
    create_table(:callers) do |t|
      t.database_authenticatable :null => false
      t.recoverable
      t.rememberable
      t.trackable

      # t.confirmable
      # t.lockable :lock_strategy => :failed_attempts, :unlock_strategy => :both
      # t.token_authenticatable


      t.timestamps
    end

    add_index :callers, :email,                :unique => true
    add_index :callers, :reset_password_token, :unique => true
    # add_index :callers, :confirmation_token,   :unique => true
    # add_index :callers, :unlock_token,         :unique => true
  end

  def self.down
    drop_table :callers
  end
end
