class CreateMarcas < ActiveRecord::Migration
  def self.up
    create_table :marcas do |t|
#      t.integer :codigo
      t.string :nome

      t.timestamps
    end
  end

  def self.down
    drop_table :marcas
  end
end
