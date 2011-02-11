class Item < ActiveRecord::Base

	belongs_to :produto
	belongs_to :fabricante

	validates_presence_of :produto_id,:fabricante_id

end
