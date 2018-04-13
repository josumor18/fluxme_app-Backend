class EmisorasController < ApplicationController
  before_action :set_emisora, only: [:show, :edit, :update, :destroy]

  # GET /emisoras
  # GET /emisoras.json
  def index
    @emisoras = Emisora.all
  end

  # GET /emisoras/1
  # GET /emisoras/1.json
  def show
  end

  # GET /emisoras/new
  def new
    @emisora = Emisora.new
  end

  # GET /emisoras/1/edit
  def edit
  end

  # POST /emisoras
  # POST /emisoras.json
  def create
    @emisora = Emisora.new(emisora_params)

    respond_to do |format|
      if @emisora.save
        format.html { redirect_to @emisora, notice: 'Emisora was successfully created.' }
        format.json { render :show, status: :created, location: @emisora }
      else
        format.html { render :new }
        format.json { render json: @emisora.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /emisoras/1
  # PATCH/PUT /emisoras/1.json
  def update
    respond_to do |format|
      if @emisora.update(emisora_params)
        format.html { redirect_to @emisora, notice: 'Emisora was successfully updated.' }
        format.json { render :show, status: :ok, location: @emisora }
      else
        format.html { render :edit }
        format.json { render json: @emisora.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /emisoras/1
  # DELETE /emisoras/1.json
  def destroy
    @emisora.destroy
    respond_to do |format|
      format.html { redirect_to emisoras_url, notice: 'Emisora was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_emisora
      @emisora = Emisora.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def emisora_params
      params.require(:emisora).permit(:nombre, :link, :id_admin)
    end
end
