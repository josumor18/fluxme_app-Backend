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
						user.authentication_token = nil
						user.save

						useremisora = UserEmisora.new(useremisora_params) 
						
						if useremisora.save
							render json: { status: 'SUCCESS', message: 'USUARIO SUSCRITO', data:user }, status: :created
						
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

			private
			def useremisora_params
				params.permit(:idUser, :idEmisora)
			end
		end
	end
end