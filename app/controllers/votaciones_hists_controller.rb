class VotacionesHistsController < ApplicationController
  before_action :set_votaciones_hist, only: [:show, :edit, :update, :destroy]

  # GET /votaciones_hists
  # GET /votaciones_hists.json
  def index
    @votaciones_hists = VotacionesHist.all
  end

  # GET /votaciones_hists/1
  # GET /votaciones_hists/1.json
  def show
  end

  # GET /votaciones_hists/new
  def new
    @votaciones_hist = VotacionesHist.new
  end

  # GET /votaciones_hists/1/edit
  def edit
  end

  # POST /votaciones_hists
  # POST /votaciones_hists.json
  def create
    @votaciones_hist = VotacionesHist.new(votaciones_hist_params)

    respond_to do |format|
      if @votaciones_hist.save
        format.html { redirect_to @votaciones_hist, notice: 'Votaciones hist was successfully created.' }
        format.json { render :show, status: :created, location: @votaciones_hist }
      else
        format.html { render :new }
        format.json { render json: @votaciones_hist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /votaciones_hists/1
  # PATCH/PUT /votaciones_hists/1.json
  def update
    respond_to do |format|
      if @votaciones_hist.update(votaciones_hist_params)
        format.html { redirect_to @votaciones_hist, notice: 'Votaciones hist was successfully updated.' }
        format.json { render :show, status: :ok, location: @votaciones_hist }
      else
        format.html { render :edit }
        format.json { render json: @votaciones_hist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /votaciones_hists/1
  # DELETE /votaciones_hists/1.json
  def destroy
    @votaciones_hist.destroy
    respond_to do |format|
      format.html { redirect_to votaciones_hists_url, notice: 'Votaciones hist was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_votaciones_hist
      @votaciones_hist = VotacionesHist.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def votaciones_hist_params
      params.require(:votaciones_hist).permit(:id_emisora, :id_cancion, :cancion, :votos)
    end
end
