class Produto < ActiveRecord::Base

	has_many :items , :dependent => :destroy
	has_many :fabricantes , :through=> :items , :dependent => :destroy

	validates_presence_of :codigo,:descricao

end
