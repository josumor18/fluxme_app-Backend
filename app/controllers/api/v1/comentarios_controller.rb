module Api
    module V1
        class ComentariosController < ApplicationController
            protect_from_forgery with: :null_session
          
            # GET /comentarios/1
            # GET /comentarios/1.json
            def get_comentarios
                user = User.where(id: params[:idUser]).first
                token = params[:authentication_token]
                
				if (user)
					if (user.authentication_token==token)
						emisora = Emisora.find(params[:emisora_id])
                        comentarios = emisora.comentarios
                        render json: { status: 'SUCCESS', message: 'Comentario', comentarios: comentarios, authentication_token:user.authentication_token }, status: :created
					else
						render json: { status: 'INVALID TOKEN', message: 'Token inválido'}, status: :unauthorized
					end
				else
					render json: { status: 'INVALID USER', message: 'Usuario Inexistente'}, status: :unauthorized
				end
            end
          
            # POST /comentarios/add_comentarios
            def add_comentarios
                user = User.where(id: params[:idUser]).first
                token = params[:authentication_token]
                
				if (user)
					if (user.authentication_token==token)
						emisora = Emisora.find(params[:emisora_id])
                        comentario = emisora.comentarios.create(comentario_params)
                        render json: { status: 'SUCCESS', message: 'Comentario', comentario: comentario, authentication_token:user.authentication_token }, status: :ok
					else
						render json: { status: 'INVALID TOKEN', message: 'Token inválido'}, status: :unauthorized
					end
				else
					render json: { status: 'INVALID USER', message: 'Usuario Inexistente'}, status: :unauthorized
				end
            end
          
            # POST /comentarios
            # POST /comentarios.json
            def create
            end
          
            # PATCH/PUT /comentarios/1
            # PATCH/PUT /comentarios/1.json
            def update
            end
          
            # DELETE /comentarios/1
            # DELETE /comentarios/1.json
            def destroy
            end
          
            private
              # Use callbacks to share common setup or constraints between actions.
              def set_comentario
                @comentario = Comentario.find(params[:id])
              end
          
              # Never trust parameters from the scary internet, only allow the white list through.
            
              def comentario_params
                params.permit(:comentarista, :cuerpo, :emisora_id)
              end
        end
    end
end