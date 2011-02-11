class Item < ActiveRecord::Base

	belongs_to :produto
	belongs_to :fabricante
	belongs_to :parecer

	validates_presence_of :produto_id,:fabricante_id,:parecer_id

end
