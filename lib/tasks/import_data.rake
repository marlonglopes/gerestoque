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


	def import_grupos_txt

	  File.open("#{Rails.root}/tabcep.txt", "r").each {|f|

		  	c=f.to_s.split("^")
			puts "#{c}"

		  	cep=c[0]
	  		localidade=c[1]
  			uf=c[2]
  			logradouro=c[5]
  			bairro=c[7]

			begin
				cep=Cep.new(:cep => cep,
								:logradouro => logradouro,
								:bairro => bairro,
								:localidade => localidade,
								:uf=>uf)
				cep.save!
			rescue
			end


		}


	def import_marcas_txt

	  File.open("#{Rails.root}/MARCAS.txt", "r").each {|f|

		  	c=f.to_s.split("^")
			puts "#{c}"

		  	cep=c[0]
	  		localidade=c[1]
  			uf=c[2]
  			logradouro=c[5]
  			bairro=c[7]

			begin
				cep=Cep.new(:cep => cep,
								:logradouro => logradouro,
								:bairro => bairro,
								:localidade => localidade,
								:uf=>uf)
				cep.save!
			rescue
			end


		}

