class Produto < ActiveRecord::Base

	belongs_to :grupo
	has_many :items , :dependent => :destroy
	has_many :marcas , :through=> :items , :dependent => :destroy

	validates_presence_of :descricao

	scope :items, includes(:items,:marcas)
	scope :favoravel, items.where("items.parecer_id = 1")

	scope :find_by_marca, lambda {|marca| 
				items.where("marcas.nome like ?","%#{marca.to_s.upcase}%")
	}

 	search_methods :find_by_marca

end
