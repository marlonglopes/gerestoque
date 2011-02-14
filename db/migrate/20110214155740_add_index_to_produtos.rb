class AddIndexToProdutos < ActiveRecord::Migration
 def self.up
		add_index :produtos, :codigo, :unique => true
 end

  def self.down
		remove_index :produtos, :codigo
  end
end
