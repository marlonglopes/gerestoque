class Item < ActiveRecord::Base

#	before_update :get_parecer_mumps
	before_save :set_parecer_mumps
#	after_find 	:get_mumps
#	after_initialize :get_mumps

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

	def parecer=(par)
		self.parecer_id=par.id
	end

	def parecer_mumps
		begin
		ret=ControllerConsomewsghc::wsghc(	:id=>15,
														:param=>"2^#{self.produto_id}^#{self.marca_id}^#{self.parecer_id}")
		@parecer=Parecer.find(ret)
		rescue
			self.parecer
		end
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

	def get_mumps2
#		logger.info("####################### get_mumps")
#		ret=ControllerConsomewsghc::wsghc(:id=>15,:param=>"2^#{self.produto_id}^#{self.parecer_id}")
#		logger.info("####################### get_mumps  2^#{self.produto_id}^#{self.parecer_id}")
#		self.parecer_id=ret
#		logger.info("####################### get_mumps  #{ret.to_s}")
#		puts ControllerConsomewsghc::wsghc(:id=>15,:param=>"2^#{self.produto_id}^#{self.parecer_id}")
#		puts "after_find get_mumps"
#		self.parecer_id=1
	end
	
	def get_parecer_mumps
		logger.info("####################### before_update :get_mumps")
		ret=ControllerConsomewsghc::wsghc(	:id=>15,
														:param=>"2^#{self.produto_id}^#{self.marca_id}^#{self.parecer_id}")
		self.parecer_id=ret
	end


	def set_parecer_mumps
		logger.info("####################### before_save :set_mumps")
		ControllerConsomewsghc::wsghc(	:id=>15,
													:param=>"1^#{self.produto_id}^#{self.marca_id}^#{self.parecer_id}")
	end
end
