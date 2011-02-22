module ItemsHelper

	def remote_addr
		request.env.grep(/REMOTE_ADDR/).to_s.include? "130" or request.env.grep(/REMOTE_ADDR/).to_s.include? "131" or 		request.env.grep(/REMOTE_ADDR/).to_s.include? "192"
	end


end
