class CreateParecers < ActiveRecord::Migration
  def self.up
    create_table :parecers do |t|
#      t.integer :codigo
      t.string :descricao

      t.timestamps
    end
  end

  def self.down
    drop_table :parecers
  end
end
