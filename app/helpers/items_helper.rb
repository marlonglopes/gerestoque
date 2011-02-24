module ItemsHelper



	def verif_mumps_icon(item)
		if logged_in? and current_user.admin? 
			item.parecer==item.parecer_mumps ? image_tag("icons/tick.png") : image_tag("icons/cross.png") 
		else
			""
		end
	end

	def verif_mumps_text(item)
		if logged_in? and current_user.admin? 
			item.parecer==item.parecer_mumps ? "Bases iguais" : "Bases diferentes"
		else
			""
		end
	end

end
