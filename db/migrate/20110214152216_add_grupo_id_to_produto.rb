class AddGrupoIdToProduto < ActiveRecord::Migration
  def self.up
    add_column :produtos, :grupo_id, :integer
  end

  def self.down
    remove_column :produtos, :grupo_id
  end
end
