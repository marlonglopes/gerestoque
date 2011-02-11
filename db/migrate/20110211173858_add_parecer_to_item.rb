class AddParecerToItem < ActiveRecord::Migration
  def self.up
    add_column :items, :parecer_id, :integer
  end

  def self.down
    remove_column :items, :parecer_id
  end
end
