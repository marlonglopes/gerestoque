class CreateProdutos < ActiveRecord::Migration
  def self.up
    create_table :produtos do |t|
#      t.integer :codigo
      t.string :descricao

      t.timestamps
    end
  end

  def self.down
    drop_table :produtos
  end
end
