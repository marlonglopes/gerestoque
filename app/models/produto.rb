class Produto < ActiveRecord::Base

	belongs_to :grupo
	has_many :items , :dependent => :destroy
	has_many :marcass , :through=> :items , :dependent => :destroy

	validates_presence_of :codigo,:descricao

end
