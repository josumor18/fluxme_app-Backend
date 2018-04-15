module Api
	module V1
		class EmisorasController < ApplicationController
			def index
				user = User.where(id: params[:id]).first
				token = params[:authentication_token]
				if (user)
					if (user.authentication_token==token)
						user.authentication_token = nil
						user.save
						list_emisoras = Emisora.all
						render json: { status: 'SUCCESS', message: 'Lista de emisoras', emisoras: list_emisoras, authentication_token:user.authentication_token }, status: :ok
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