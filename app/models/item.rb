class Item < ActiveRecord::Base

	before_save :set_mumps
	after_find 	:get_mumps
	after_initialize :get_mumps2

#	include Consomewsghc

	belongs_to :produto
	belongs_to :marca
	belongs_to :parecer

	validates_presence_of :produto,:marca,:parecer

 	validates_associated :produto, :marca, :parecer

	scope :favoravel, where(:parecer_id=>1)

	def parecer
		@parecer=Parecer.find(self.parecer_id)
	end

#	def parecer_id=(id)
#    write_attribute(:parecer_id, id)
#  end

#  def parecer_id
#	ret=wsghc(:id=>15,:param=>"2^#{self.produto_id}^#{self.parecer_id}")
#	write_attribute(:parecer_id, ret)
#	read_attribute(:parecer_id)
##	self[:parecer_id]=ret
##	read_attribute(:parecer_id)
#  end

private

	def get_mumps
#		logger.info("####################### get_mumps")
#		ret=ControllerConsomewsghc::wsghc(:id=>15,:param=>"2^#{self.produto_id}^#{self.parecer_id}")
#		logger.info("####################### get_mumps  2^#{self.produto_id}^#{self.parecer_id}")
#		self.parecer_id=ret
#		logger.info("####################### get_mumps  #{ret.to_s}")
#		puts ControllerConsomewsghc::wsghc(:id=>15,:param=>"2^#{self.produto_id}^#{self.parecer_id}")
#		puts "after_find get_mumps"
#		self.parecer_id=1
	end
	
	def get_mumps2
		ret=ControllerConsomewsghc::wsghc(:id=>15,:param=>"2^#{self.produto_id}^#{self.parecer_id}")
#		puts "after_initialize get_mumps2"
		self.parecer_id=ret
	end


	def set_mumps
#		logger.info("####################### set_mumps")
		ControllerConsomewsghc::wsghc(:id=>15,:param=>"1^#{self.produto_id}^#{self.parecer_id}")
	end
end
