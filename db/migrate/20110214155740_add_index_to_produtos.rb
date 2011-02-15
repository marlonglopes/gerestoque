class AddIndexToProdutos < ActiveRecord::Migration
 def self.up
		add_index :produtos, :descricao
 end

  def self.down
		remove_index :produtos, :descricao
  end
end
