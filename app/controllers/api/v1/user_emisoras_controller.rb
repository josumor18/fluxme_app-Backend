module Api
	module V1
		class UserEmisorasController < ApplicationController
			def setSuscription
				user = User.where(id: params[:idUser]).first
				emisora = Emisora.where(id: params[:idEmisora]).first
				
				if (user && emisora)
					useremisora = UserEmisoras.new(useremisora_params) 
					
					if useremisora.save
						render json: { status: 'SUCCESS', message: 'USUARIO SUSCRITO', data:user }, status: :created
					
					else	
						render json: { status: 'ERROR', message: 'USUARIO YA SUSCRITO' }, status: :unauthorized
					
					end
				end

			end

			private
			def useremisora_params
				params.permit(:idUser, :idEmisora)
			end
		end
	end
end