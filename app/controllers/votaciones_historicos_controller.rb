class VotacionesHistoricosController < ApplicationController
  before_action :set_votaciones_historico, only: [:show, :edit, :update, :destroy]

  # GET /votaciones_historicos
  # GET /votaciones_historicos.json
  def index
    @votaciones_historicos = VotacionesHistorico.all
  end

  # GET /votaciones_historicos/1
  # GET /votaciones_historicos/1.json
  def show
  end

  # GET /votaciones_historicos/new
  def new
    @votaciones_historico = VotacionesHistorico.new
  end

  # GET /votaciones_historicos/1/edit
  def edit
  end

  # POST /votaciones_historicos
  # POST /votaciones_historicos.json
  def create
    @votaciones_historico = VotacionesHistorico.new(votaciones_historico_params)

    respond_to do |format|
      if @votaciones_historico.save
        format.html { redirect_to @votaciones_historico, notice: 'Votaciones historico was successfully created.' }
        format.json { render :show, status: :created, location: @votaciones_historico }
      else
        format.html { render :new }
        format.json { render json: @votaciones_historico.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /votaciones_historicos/1
  # PATCH/PUT /votaciones_historicos/1.json
  def update
    respond_to do |format|
      if @votaciones_historico.update(votaciones_historico_params)
        format.html { redirect_to @votaciones_historico, notice: 'Votaciones historico was successfully updated.' }
        format.json { render :show, status: :ok, location: @votaciones_historico }
      else
        format.html { render :edit }
        format.json { render json: @votaciones_historico.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /votaciones_historicos/1
  # DELETE /votaciones_historicos/1.json
  def destroy
    @votaciones_historico.destroy
    respond_to do |format|
      format.html { redirect_to votaciones_historicos_url, notice: 'Votaciones historico was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_votaciones_historico
      @votaciones_historico = VotacionesHistorico.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def votaciones_historico_params
      params.require(:votaciones_historico).permit(:id_emisora, :cancion, :votos)
    end
end
