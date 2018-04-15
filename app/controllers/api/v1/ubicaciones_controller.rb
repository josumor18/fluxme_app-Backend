module Api
	module V1
		class UbicacionesController < ApplicationController
			protect_from_forgery with: :null_session

			#Agrega una nueva ubicacion
			def add
				user = User.where(id: params[:id_user]).first
				token = params[:authentication_token]
				if(user)
					if (user.authentication_token==token)
						Ubicacion.where(id_user: params[:id_user]).destroy_all
						ubicacion = Ubicacion.new(id_user: params[:id_user], id_emisora: params[:id_emisora], longitud: params[:longitud], latitud: params[:latitud])
						if (ubicacion.save)
							user.authentication_token = nil
							user.save
							render json: { status: 'SUCCESS', message: 'Ubicacion agregada', authentication_token:user.authentication_token }, status: :ok
						else
							render json: { status: 'ERROR', message: 'Ubicacion no agregada'}, status: :bad
						end
						
					else
						render json: { status: 'INVALID TOKEN', message: 'Token inválido'}, status: :unauthorized
					end
				else
					render json: { status: 'INVALID USER', message: 'Usuario Inexistente'}, status: :unauthorized
				end
			end

			#Devuelve todas las ubicaciones para una emisora
			def get
				user = User.where(id: params[:id]).first
				token = params[:authentication_token]
				if (user)
					if (user.authentication_token==token)
						user.authentication_token = nil
						user.save
						
						lista_ubicacion = Ubicacion.where(id_emisora: params[:id_emisora])
						render json: { status: 'SUCCESS', message: 'Lista de ubicaciones', ubicaciones: lista_ubicacion, authentication_token:user.authentication_token }, status: :ok
						
					else
						render json: { status: 'INVALID TOKEN', message: 'Token inválido'}, status: :unauthorized
					end
				else
					render json: { status: 'INVALID USER', message: 'Usuario Inexistente'}, status: :unauthorized
				end
			end

			#Eliminar ubicacion de un usuario
			def del_ubicacion
				user = User.where(id: params[:id_user]).first
				token = params[:authentication_token]
				if(user)
					if (user.authentication_token==token)
						Ubicacion.where(id_user: params[:id_user]).destroy_all

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