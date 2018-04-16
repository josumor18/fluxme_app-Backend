module Api
	module V1
		class TrendingsController < ApplicationController
			protect_from_forgery with: :null_session

			#Obtener las tendencias para una emisora
			def get
				user = User.where(id: params[:id]).first
				token = params[:authentication_token]
				if (user)
					if (user.authentication_token==token)
						user.authentication_token = nil
						user.save
						
						tendencias = Trending.where(id_emisora: params[:id_emisora])
						render json: { status: 'SUCCESS', message: 'Lista de ubicaciones', trending: tendencias, authentication_token:user.authentication_token }, status: :ok
						
					else
						render json: { status: 'INVALID TOKEN', message: 'Token inválido'}, status: :unauthorized
					end
				else
					render json: { status: 'INVALID USER', message: 'Usuario Inexistente'}, status: :unauthorized
				end
			end

			#Agrega una nueva lista de tendencias
			def add
				user = User.where(id: params[:id_user]).first
				token = params[:authentication_token]
				if(user)
					if (user.authentication_token==token)
						id_emisora = params[:id_emisora]
						Trending.where(id_emisora: id_emisora).destroy_all
						
						json = JSON.parse(params[:tendencias])
						json["Lista_Canciones"].each do |atribs|
							posicion = atribs["posicion"]
							cancion = atribs["cancion"]
							artista = atribs["artista"]
							linkImg = atribs["imagen"]

							trend = Trending.new(id_emisora: id_emisora, posicion: posicion, cancion: cancion, artista: artista, imagen: linkImg)
							trend.save
						end

						user.authentication_token = nil
						user.save
						render json: { status: 'SUCCESS', message: 'Lista agregada', authentication_token:user.authentication_token }, status: :ok
						
					else
						render json: { status: 'INVALID TOKEN', message: 'Token inválido'}, status: :unauthorized
					end
				else
					render json: { status: 'INVALID USER', message: 'Usuario Inexistente'}, status: :unauthorized
				end
			end
		end
	end
end