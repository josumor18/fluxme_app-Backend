class UserEmisorasController < ApplicationController
  before_action :set_user_emisora, only: [:show, :edit, :update, :destroy]

  # GET /user_emisoras
  # GET /user_emisoras.json
  def index
    @user_emisoras = UserEmisora.all
  end

  # GET /user_emisoras/1
  # GET /user_emisoras/1.json
  def show
  end

  # GET /user_emisoras/new
  def new
    @user_emisora = UserEmisora.new
  end

  # GET /user_emisoras/1/edit
  def edit
  end

  # POST /user_emisoras
  # POST /user_emisoras.json
  def create
    @user_emisora = UserEmisora.new(user_emisora_params)

    respond_to do |format|
      if @user_emisora.save
        format.html { redirect_to @user_emisora, notice: 'User emisora was successfully created.' }
        format.json { render :show, status: :created, location: @user_emisora }
      else
        format.html { render :new }
        format.json { render json: @user_emisora.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_emisoras/1
  # PATCH/PUT /user_emisoras/1.json
  def update
    respond_to do |format|
      if @user_emisora.update(user_emisora_params)
        format.html { redirect_to @user_emisora, notice: 'User emisora was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_emisora }
      else
        format.html { render :edit }
        format.json { render json: @user_emisora.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_emisoras/1
  # DELETE /user_emisoras/1.json
  def destroy
    @user_emisora.destroy
    respond_to do |format|
      format.html { redirect_to user_emisoras_url, notice: 'User emisora was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_emisora
      @user_emisora = UserEmisora.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_emisora_params
      params.require(:user_emisora).permit(:idUser, :idEmisora)
    end
end
