module Api
	module V1
		class ProgramacionsController < ApplicationController
			protect_from_forgery with: :null_session
			def setProgramacion
				user = User.where(id: params[:idUser]).first
				emisora = Emisora.where(id: params[:idEmisora]).first
				token = params[:authentication_token]

				if (user && emisora)

					if (user.authentication_token==token)
						

						programacion = Programacion.new(programacion_params) 
						
						if programacion.save
							user.authentication_token = nil
							user.save
							render json: { status: 'SUCCESS', message: 'PROGRAMACION AGREGADA', authentication_token:user.authentication_token }, status: :created
						
						else	
							render json: { status: 'ERROR', message: 'PROGRAMACION NO AGREGADA' }, status: :unauthorized
						
						end
					
					else
						render json: { status: 'INVALID TOKEN', message: 'Token inválido'}, status: :unauthorized
					end
				
				else
					render json: { status: 'INVALID USER', message: 'Usuario Inexistente'}, status: :unauthorized
				end
				

			end

			

			private
			def programacion_params
				params.permit(:idUser, :idEmisora, :dia, :hora, :titulo)
			end
		end
	end
end