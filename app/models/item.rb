class Item < ActiveRecord::Base

	belongs_to :produto
	belongs_to :marca
	belongs_to :parecer

	validates_presence_of :produto,:marca,:parecer

 	validates_associated :produto, :marca, :parecer

end
