class Fabricante < ActiveRecord::Base

	has_many :items , :dependent => :destroy
	has_many :produtos, :through=>:items , :dependent => :destroy

	validates_presence_of :codigo,:nome
	

end
