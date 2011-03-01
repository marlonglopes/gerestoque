class Item < ActiveRecord::Base

#	after_find :get_parecer_mumps
#	before_save :set_parecer_mumps

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

		return self.parecer

		begin
		
#			logger.info("####################### before_update :get_mumps")
			ret=ControllerConsomewsghc::wsghc(	:id=>15,
															:param=>"2^#{self.produto_id}^#{self.marca_id}^#{self.parecer_id}")

			@parecer=Parecer.find(ret)
		rescue
			self.parecer
		end
	end

private

	
	def get_parecer_mumps
#		logger.info("####################### before_update :get_mumps")

		begin
			ret=ControllerConsomewsghc::wsghc(	:id=>15,
															:param=>"2^#{self.produto_id}^#{self.marca_id}^#{self.parecer_id}")
			if ret.to_i!=0
				self.parecer_id=ret
				self.save!
			end
		rescue
		end
	end


	def set_parecer_mumps
#		logger.info("####################### before_save :set_mumps")
		
		begin
			ControllerConsomewsghc::wsghc(	:id=>15,
														:param=>"1^#{self.produto_id}^#{self.marca_id}^#{self.parecer_id}")
		rescue
		end
	end
end
