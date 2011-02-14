class Grupo < ActiveRecord::Base

	has_many :produtos, :dependent => :destroy
	
end
