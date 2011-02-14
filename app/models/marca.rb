class Marca < ActiveRecord::Base

	has_many :items , :dependent => :destroy
	has_many :produtos, :through=>:items , :dependent => :destroy

	validates_presence_of :nome
	

end
