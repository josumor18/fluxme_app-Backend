module Api
	module V1
		class VotacionesController < ApplicationController
			protect_from_forgery with: :null_session

			#Agrega una nueva canción
			def add_cancion
				user = User.where(id: params[:id_user]).first
				token = params[:authentication_token]
				if(user)
					if (user.authentication_token==token)
						cancion = VotacionesHistorico.find_by(id_emisora: params[:id_emisora], cancion: params[:cancion])
						if (!cancion)
							voto = VotacionesHistorico.new(id_emisora: params[:id_emisora], cancion: params[:cancion], votos: 0)
							
							if(voto.save)
								user.authentication_token = nil
								user.save
								render json: { status: 'SUCCESS', message: 'Voto agregado', authentication_token:user.authentication_token }, status: :ok
							end
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

						render json: { status: 'DELETED', message: 'Ubicacion eliminada'}, status: :ok
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