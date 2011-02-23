class Item < ActiveRecord::Base

	before_save :set_mumps

	include Consomewsghc

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

	def after_find
		logger.info("####################### after_find")
		ret=wsghc(:id=>15,:param=>"2^#{self.produto_id}^#{self.parecer_id}")
#		logger.info("####################### get_mumps  2^#{self.produto_id}^#{self.parecer_id}")
		self.parecer_id=1000
#		logger.info("####################### get_mumps  #{ret.to_s}")

	end

private

	def set_mumps
		logger.info("####################### set_mumps")
		wsghc(:id=>15,:param=>"1^#{self.produto_id}^#{self.parecer_id}")
	end
end
