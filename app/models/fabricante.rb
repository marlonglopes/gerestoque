class Fabricante < ActiveRecord::Base

	has_many :items
	has_many :produtos, :through=>:items

end
