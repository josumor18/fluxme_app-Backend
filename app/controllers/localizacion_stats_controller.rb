class LocalizacionStatsController < ApplicationController
  before_action :set_localizacion_stat, only: [:show, :edit, :update, :destroy]

  # GET /localizacion_stats
  # GET /localizacion_stats.json
  def index
    @localizacion_stats = LocalizacionStat.all
  end

  # GET /localizacion_stats/1
  # GET /localizacion_stats/1.json
  def show
  end

  # GET /localizacion_stats/new
  def new
    @localizacion_stat = LocalizacionStat.new
  end

  # GET /localizacion_stats/1/edit
  def edit
  end

  # POST /localizacion_stats
  # POST /localizacion_stats.json
  def create
    @localizacion_stat = LocalizacionStat.new(localizacion_stat_params)

    respond_to do |format|
      if @localizacion_stat.save
        format.html { redirect_to @localizacion_stat, notice: 'Localizacion stat was successfully created.' }
        format.json { render :show, status: :created, location: @localizacion_stat }
      else
        format.html { render :new }
        format.json { render json: @localizacion_stat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /localizacion_stats/1
  # PATCH/PUT /localizacion_stats/1.json
  def update
    respond_to do |format|
      if @localizacion_stat.update(localizacion_stat_params)
        format.html { redirect_to @localizacion_stat, notice: 'Localizacion stat was successfully updated.' }
        format.json { render :show, status: :ok, location: @localizacion_stat }
      else
        format.html { render :edit }
        format.json { render json: @localizacion_stat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /localizacion_stats/1
  # DELETE /localizacion_stats/1.json
  def destroy
    @localizacion_stat.destroy
    respond_to do |format|
      format.html { redirect_to localizacion_stats_url, notice: 'Localizacion stat was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_localizacion_stat
      @localizacion_stat = LocalizacionStat.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def localizacion_stat_params
      params.require(:localizacion_stat).permit(:id_user, :id_emisora, :ciudad, :pais, :longitud, :latitud)
    end
end
