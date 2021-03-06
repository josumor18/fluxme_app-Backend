module Api
	module V1
		class UserEmisorasController < ApplicationController
			protect_from_forgery with: :null_session
			def setSuscription
				user = User.where(id: params[:idUser]).first
				emisora = Emisora.where(id: params[:idEmisora]).first
				token = params[:authentication_token]

				if (user && emisora)

					if (user.authentication_token==token)
						

						useremisora = UserEmisora.new(useremisora_params) 
						
						if useremisora.save
							user.authentication_token = nil
							user.save
							render json: { status: 'SUCCESS', message: 'USUARIO SUSCRITO', authentication_token:user.authentication_token }, status: :created
						
						else	
							render json: { status: 'ERROR', message: 'USUARIO YA SUSCRITO' }, status: :unauthorized
						
						end
					
					else
						render json: { status: 'INVALID TOKEN', message: 'Token inválido'}, status: :unauthorized
					end
				
				else
					render json: { status: 'INVALID USER', message: 'Usuario Inexistente'}, status: :unauthorized
				end
				

			end

			def isSuscripted

				user = User.where(id: params[:idUser]).first
				useremisora = UserEmisora.find_by(idUser: params[:idUser],idEmisora: params[:idEmisora])
				token = params[:authentication_token]

				if (user&.authentication_token==token)
					
				
					if(useremisora)
						user.authentication_token = nil
						user.save
						render json: { status: 'SUCCESS', message: 'USUARIO SUSCRITO', authentication_token:user.authentication_token}, status: :ok
					else
						render json: { status: 'ERROR', message: 'USUARIO NO SUSCRITO' }, status: :bad
					end
				else
					render json: { status: 'INVALID TOKEN', message: 'Token inválido'}, status: :unauthorized
					
				end
			end

			def deleteSuscription

				user = User.where(id: params[:idUser]).first
				useremisora = UserEmisora.find_by(idUser: params[:idUser],idEmisora: params[:idEmisora])
				token = params[:authentication_token]

				if (user&.authentication_token==token)
					
				
					if(useremisora)
						

						UserEmisora.where(idUser: params[:idUser]).where(idEmisora: params[:idEmisora]).destroy_all
						render json: { status: 'SUCCESS', message: 'SUSCRIPCION CANCELADA'}, status: :ok
					else
						render json: { status: 'ERROR', message: 'USUARIO NO SUSCRITO' }, status: :bad
					end
				else
					render json: { status: 'INVALID TOKEN', message: 'Token inválido'}, status: :unauthorized
					
				end
			end

			def getEmisorasFavoritas
				user = User.where(id: params[:id]).first
				token = params[:authentication_token]
				if (user)
					if (user.authentication_token==token)
						
						list_emisoras = UserEmisora.where(idUser: params[:id])
						if(list_emisoras)
							user.authentication_token = nil
							user.save
							render json: { status: 'SUCCESS', message: 'Lista de emisoras', emisoras: list_emisoras, authentication_token:user.authentication_token }, status: :ok
						end
					else
						render json: { status: 'INVALID TOKEN', message: 'Token inválido'}, status: :unauthorized
					end
				else
					render json: { status: 'INVALID USER', message: 'Usuario Inexistente'}, status: :unauthorized
				end
			end


			private
			def useremisora_params
				params.permit(:idUser, :idEmisora)
			end
		end
	end
end