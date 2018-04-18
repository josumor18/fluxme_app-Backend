class ProgramacionsController < ApplicationController
  before_action :set_programacion, only: [:show, :edit, :update, :destroy]

  # GET /programacions
  # GET /programacions.json
  def index
    @programacions = Programacion.all
  end

  # GET /programacions/1
  # GET /programacions/1.json
  def show
  end

  # GET /programacions/new
  def new
    @programacion = Programacion.new
  end

  # GET /programacions/1/edit
  def edit
  end

  # POST /programacions
  # POST /programacions.json
  def create
    @programacion = Programacion.new(programacion_params)

    respond_to do |format|
      if @programacion.save
        format.html { redirect_to @programacion, notice: 'Programacion was successfully created.' }
        format.json { render :show, status: :created, location: @programacion }
      else
        format.html { render :new }
        format.json { render json: @programacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /programacions/1
  # PATCH/PUT /programacions/1.json
  def update
    respond_to do |format|
      if @programacion.update(programacion_params)
        format.html { redirect_to @programacion, notice: 'Programacion was successfully updated.' }
        format.json { render :show, status: :ok, location: @programacion }
      else
        format.html { render :edit }
        format.json { render json: @programacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /programacions/1
  # DELETE /programacions/1.json
  def destroy
    @programacion.destroy
    respond_to do |format|
      format.html { redirect_to programacions_url, notice: 'Programacion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_programacion
      @programacion = Programacion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def programacion_params
      params.require(:programacion).permit(:idUser, :idEmisora, :dia, :hora, :titulo)
    end
end
