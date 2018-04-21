module Api
	module V1
		class VotacionesController < ApplicationController
			protect_from_forgery with: :null_session

			#Obtiene las canciones actuales de la emisora
			def get_canciones
				user = User.where(id: params[:id_user]).first
				token = params[:authentication_token]
				if (user)
					if (user.authentication_token==token)
						user.authentication_token = nil
						user.save
						
						lista_canciones = VotacionesTemporal.where(id_emisora: params[:id_emisora])
						render json: { status: 'SUCCESS', message: 'Lista de canciones', canciones: lista_canciones, authentication_token:user.authentication_token }, status: :ok
						
					else
						render json: { status: 'INVALID TOKEN', message: 'Token inválido'}, status: :unauthorized
					end
				else
					render json: { status: 'INVALID USER', message: 'Usuario Inexistente'}, status: :unauthorized
				end
			end

			#Agrega una nueva canción
			def add_cancion
				user = User.where(id: params[:id_user]).first
				token = params[:authentication_token]
				if(user)
					if (user.authentication_token==token)
						voto = VotacionesHist.find_by(id_emisora: params[:id_emisora], cancion: params[:cancion])
						if(!voto)
							voto = VotacionesHist.new(id_emisora: params[:id_emisora], cancion: params[:cancion], votos: 0)
						end
						if(voto.save)
									nueva = VotacionesTemporal.new(id_emisora: params[:id_emisora], id_cancion: voto.id, cancion: params[:cancion], votos:0)
									if(nueva.save)
										user.authentication_token = nil
										user.save

										lista_canciones = VotacionesTemporal.where(id_emisora: params[:id_emisora])
										render json: { status: 'SUCCESS', message: 'Cancion agregada', canciones: lista_canciones, authentication_token:user.authentication_token }, status: :ok
									else
										render json: { status: 'ERROR', message: 'Canción no agregada'}, status: :bad
									end
						end
					else
						render json: { status: 'INVALID TOKEN', message: 'Token inválido'}, status: :unauthorized
					end
				else
					render json: { status: 'INVALID USER', message: 'Usuario Inexistente'}, status: :unauthorized
				end
			end

			#Eliminar voto de un usuario
			def del_cancion
				user = User.where(id: params[:id_user]).first
				token = params[:authentication_token]
				if(user)
					if (user.authentication_token==token)
						canc = VotacionesTemporal.where(id_emisora: params[:id_emisora]).where(id_cancion: params[:id_cancion]).first
						VotoTemp.where(id_voto: canc.id).where(id_user: params[:id_user]).destroy_all

						VotacionesTemporal.where(id_emisora: params[:id_emisora]).where(id_cancion: params[:id_cancion]).destroy_all

						

						render json: { status: 'DELETED', message: 'Canción eliminada'}, status: :ok
					else
						render json: { status: 'INVALID TOKEN', message: 'Token inválido'}, status: :unauthorized
					end
				else
					render json: { status: 'INVALID USER', message: 'Usuario Inexistente'}, status: :unauthorized
				end
			end

			#######################################################################################

			#Agrega una nueva ubicación
			def add_voto
				user = User.where(id: params[:id_user]).first
				token = params[:authentication_token]
				if(user)
					if (user.authentication_token==token)
						canc = VotacionesTemporal.where(id_emisora: params[:id_emisora]).where(id_cancion: params[:id_cancion]).first
						voto = VotoTemp.new(id_user: params[:id_user], id_voto: canc.id)
						if (voto.save)
							votoH = VotacionesHist.find_by(id: params[:id_cancion])
							votoH.update(:votos=> votoH.votos + 1)
							canc.update(:votos=>canc.votos + 1)
							
							user.authentication_token = nil
							user.save
							render json: { status: 'SUCCESS', message: 'Voto agregado', authentication_token:user.authentication_token }, status: :ok
						else
							render json: { status: 'ERROR', message: 'Voto no agregado'}, status: :bad
						end
						
					else
						render json: { status: 'INVALID TOKEN', message: 'Token inválido'}, status: :unauthorized
					end
				else
					render json: { status: 'INVALID USER', message: 'Usuario Inexistente'}, status: :unauthorized
				end
			end

			

			#Obtiene los votos actuales del usuario
			def get_mis_votos
				user = User.where(id: params[:id]).first
				token = params[:authentication_token]
				if (user)
					if (user.authentication_token==token)
						user.authentication_token = nil
						user.save
						
						lista_votos = VotoTemp.where(id_user: params[:id_user]).where(id_emisora: params[:id_emisora])
						render json: { status: 'SUCCESS', message: 'Lista de votos', ubicaciones: lista_votos, authentication_token:user.authentication_token }, status: :ok
						
					else
						render json: { status: 'INVALID TOKEN', message: 'Token inválido'}, status: :unauthorized
					end
				else
					render json: { status: 'INVALID USER', message: 'Usuario Inexistente'}, status: :unauthorized
				end
			end

			#Eliminar voto de un usuario

		end
	end
end