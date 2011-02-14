# encoding: utf-8

require 'soap/wsdlDriver'

require 'faker'

	namespace :db do
		desc "Fill database with grupo data"
			task :importa_grupos => :environment do
				import_grupos_txt
		end
	end

	namespace :db do
		desc "Fill database with marca data"
			task :importa_marcas => :environment do
				import_marcas_txt
		end
	end


	namespace :db do
		desc "Fill database with produto data"
			task :importa_produtos => :environment do
				import_produtos_txt
		end
	end


	namespace :db do
		desc "Fill database with items data"
			task :cria_items => :environment do
				cria_items
		end
	end


	def import_grupos_txt

	  File.open("#{Rails.root}/GRUPOS.TXT", "r").each {|f|

		  	c=f.to_s.split("^")

			puts "#{c}"

		  	id=c[0]
	  		descricao=c[1]

#			begin
				grupo=Grupo.new
				grupo.id=id
				grupo.descricao=descricao
				grupo.save!
#			rescue
#			end
		}

	end

	def import_marcas_txt

	  File.open("#{Rails.root}/MARCAS.TXT", "r").each {|f|

		  	c=f.to_s.split("^")
			puts "#{c}"

		  	id=c[0]
	  		nome=c[1]

			begin
				marca=Marca.new
				marca.id=id
				marca.nome=nome
				marca.save!
			rescue
			end
		}

	end
	
	def import_produtos_txt

	  File.open("#{Rails.root}/PRODUTOS.TXT", "r").each {|f|

		  	c=f.to_s.split("^")
			puts "#{c}"

		  	id=c[0]
	  		descricao=c[1]
	  		grupo_id=c[2]

			begin
				produto=Produto.new
				produto.id=id
				produto.descricao=descricao
				produto.grupo_id=grupo_id
				produto.save!
			rescue
			end
		}
	end
	
	
	def cria_items

	  File.open("#{Rails.root}/PRODUTOS.TXT", "r").each {|f|

		  	c=f.to_s.split("^")

			puts "#{c}"

		  	produto_id=c[0]
	  		marca_id=c[3]
	  		parecer_id=c[4].chop
			
			parecer={"F"=>1,"D"=>2,"A"=>3, "NC"=>4}
			
			begin
				item=Item.new
				item.produto_id=produto_id
				item.marca_id=marca_id
				item.parecer_id=parecer[parecer_id]
				item.save!
			rescue
			end

		}
	end
