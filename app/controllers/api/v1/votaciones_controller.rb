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
						
						lista_canciones = CancionesVotar.where(id_emisora: params[:id_emisora])
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
						cancion = CancionesVotar.find_by(id_emisora: params[:id_emisora], cancion: params[:cancion])
						if (!cancion)
							cancion = CancionesVotar.new(id_emisora: params[:id_emisora], cancion: params[:cancion])
							if (cancion.save)
								voto = VotacionesHistorico.find_by(id_emisora: params[:id_emisora], cancion: params[:cancion])
								if(!voto)
									voto = VotacionesHistorico.new(id_emisora: params[:id_emisora], cancion: params[:cancion], votos: 0)
								end
								if(voto.save)
									user.authentication_token = nil
									user.save
									render json: { status: 'SUCCESS', message: 'Cancion agregada', authentication_token:user.authentication_token }, status: :ok
								end
							end
						else
							render json: { status: 'ERROR', message: 'Canción no agregada'}, status: :bad
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
						CancionesVotar.where(id_emisora: params[:id_emisora]).where(cancion: params[:cancion]).destroy_all

						Voto.where(id_emisora: params[:id_emisora]).where(cancion: params[:cancion]).destroy_all

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
						Voto.where(id_user: params[:id_user]).where(id_emisora: params[:id_emisora]).where(cancion: params[:cancion]).destroy_all
						voto = Voto.new(id_user: params[:id_user], id_emisora: params[:id_emisora], cancion: params[:cancion])
						if (voto.save)
							votH = VotacionesHistorico.find_by(id_emisora: params[:id_emisora], cancion: params[:cancion])
							votoH.update(:votos=> votoH.votos + 1)
							
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
						
						lista_votos = Voto.where(id_user: params[:id_user]).where(id_emisora: params[:id_emisora])
						render json: { status: 'SUCCESS', message: 'Lista de votos', ubicaciones: lista_votos, authentication_token:user.authentication_token }, status: :ok
						
					else
						render json: { status: 'INVALID TOKEN', message: 'Token inválido'}, status: :unauthorized
					end
				else
					render json: { status: 'INVALID USER', message: 'Usuario Inexistente'}, status: :unauthorized
				end
			end

			#Eliminar voto de un usuario
			def del_voto
				user = User.where(id: params[:id_user]).first
				token = params[:authentication_token]
				if(user)
					if (user.authentication_token==token)
						Voto.where(id_user: params[:id_user]).where(id_emisora: params[:id_emisora]).where(cancion: params[:cancion]).destroy_all

						votH = VotacionesHistorico.find_by(id_emisora: params[:id_emisora], cancion: params[:cancion])
						votoH.update(:votos=> votoH.votos - 1)

						render json: { status: 'DELETED', message: 'Voto eliminado'}, status: :ok
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