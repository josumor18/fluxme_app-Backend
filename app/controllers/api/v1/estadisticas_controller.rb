module Api
    module V1
        class EstadisticasController < ApplicationController
            protect_from_forgery with: :null_session
          
            def get_ubicaciones
                user = User.where(id: params[:idUser]).first
                token = params[:authentication_token]
                
				if (user)
					if (user.authentication_token==token)
						localizaciones = LocalizacionStat.where(id_emisora: params[:id_emisora])
                        render json: { status: 'SUCCESS', message: 'Historico Ubicaciones', localizaciones: localizaciones, authentication_token:user.authentication_token }, status: :ok
					else
						render json: { status: 'INVALID TOKEN', message: 'Token inválido'}, status: :unauthorized
					end
				else
					render json: { status: 'INVALID USER', message: 'Usuario Inexistente'}, status: :unauthorized
				end
            end

            def get_votaciones
                user = User.where(id: params[:idUser]).first
                token = params[:authentication_token]
                
				if (user)
					if (user.authentication_token==token)
						historico = VotacionesHistorico.where(id_emisora: params[:id_emisora])
                        render json: { status: 'SUCCESS', message: 'Historico Votaciones', historico: historico, authentication_token:user.authentication_token }, status: :ok
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