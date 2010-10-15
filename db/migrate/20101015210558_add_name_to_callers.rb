class AddNameToCallers < ActiveRecord::Migration
  def self.up
    add_column :callers, :name, :string
  end

  def self.down
    remove_column :callers, :name
  end
end
