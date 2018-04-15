module Api
	module V1
		class UsersController < ApplicationController
			#acts_as_token_authentication_handler_for User
			protect_from_forgery with: :null_session

			def index
				users = User.order('created_at DESC');
				render json: { status: 'SUCCESS', message: 'Loaded users', data:users }, status: :ok
			end

			def login
				#email = params[:email]
				user = User.where(email: params[:email]).first
				pass = params[:encrypted_password]#(params[:encrypted_password])
				#token = params[:authentication_token]
				if (user&.valid_password?(pass))# || (user.authentication_token==token)
					user.authentication_token = nil
					user.save
					render json: { status: 'SUCCESS', message: 'SESION INICIADA', data:user }, status: :ok
				else
					render json: { status: 'INVALID', message: 'Error al iniciar sesion'}, status: :unauthorized
				end
			end

			def login_token
				user = User.where(email: params[:email]).first
				token = params[:authentication_token]

				if (user&.authentication_token==token)
					user.authentication_token = nil
					user.save
					render json: { status: 'SUCCESS', message: 'SESION INICIADA', data:user }, status: :ok
				else
					render json: { status: 'INVALID', message: 'Error al iniciar sesion'}, status: :unauthorized
				end
			end

			def login_facebook
				#email = params[:email]
				user = User.where(email: params[:email]).first
				#pass = params[:encrypted_password]#(params[:encrypted_password])
				token = params[:authentication_token]
				if user
						user.authentication_token = nil
						user.save
						render json: { status: 'SUCCESS', message: 'SESION INICIADA', data:user }, status: :ok
				else
					user = User.new(name: params[:name], email: params[:email], password: params[:authentication_token], password_confirmation: params[:authentication_token])
					if user.save
						render json: { status: 'SUCCESS', message: 'SESION INICIADA', data:user }, status: :ok
					elsif user = User.where(email: params[:email]).first
						render json: { status: 'ERROR', message: 'USUARIO EXISTENTE' }, status: :unauthorized
					else
						render json: { status: 'ERROR', message: 'USUARIO NO CREADO' }, status: :bad
					end
				end
				
			end

			def register
				user = User.new(user_params)
				if user.save
					render json: { status: 'SUCCESS', message: 'USUARIO REGISTRADO', data:user }, status: :created
				elsif user = User.where(email: params[:email]).first
					render json: { status: 'ERROR', message: 'USUARIO EXISTENTE' }, status: :unauthorized
				else
					render json: { status: 'ERROR', message: 'USUARIO NO CREADO' }, status: :bad
				end
			end

			private
			def user_params
				params.permit(:name, :email, :password, :password_confirmation)
			end
		end
	end
end