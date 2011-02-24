module ItemsHelper

	def verif_mumps_icon(item)
		item.parecer==item.parecer_mumps ? image_tag("icons/tick.png") : image_tag("icons/cross.png") 
	end

	def verif_mumps_text(item)
		ret=""
		item.parecer==item.parecer_mumps ? "Bases iguais" : "Bases diferentes"
	end

end
