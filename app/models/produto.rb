class Produto < ActiveRecord::Base

	has_many :items
	has_many :fabricantes , :through=> items

end
