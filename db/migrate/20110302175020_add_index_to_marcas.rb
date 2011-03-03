class AddIndexToMarcas < ActiveRecord::Migration
  def self.up

		add_index :marcas, :nome

  end

  def self.down
		remove_index :marcas, :nome

  end
end
