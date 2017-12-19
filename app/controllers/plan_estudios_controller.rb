class PlanEstudiosController < ApplicationController
  before_action :set_plan_estudio, only: [:show, :edit, :update, :destroy]

  # GET /plan_estudios
  # GET /plan_estudios.json
  def index
    @plan_estudios = PlanEstudio.all
  end

  # GET /plan_estudios/1
  # GET /plan_estudios/1.json
  def show
  end

  # GET /plan_estudios/new
  def new
    @plan_estudio = PlanEstudio.new
    @carreras = Carrera.all
  end

  # GET /plan_estudios/1/edit
  def edit
  end

  # POST /plan_estudios
  # POST /plan_estudios.json
  def create
    puts plan_estudio_params
    @plan_estudio = PlanEstudio.new(plan_estudio_params)
    carrera = Carrera.find(plan_estudio_params[:carrera_id])
    @plan_estudio.carrera = carrera
    respond_to do |format|
      if @plan_estudio.save
        format.html { redirect_to @plan_estudio, notice: 'Plan estudio was successfully created.' }
        format.json { render :show, status: :created, location: @plan_estudio }
      else
        format.html { render :new }
        format.json { render json: @plan_estudio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /plan_estudios/1
  # PATCH/PUT /plan_estudios/1.json
  def update
    respond_to do |format|
      if @plan_estudio.update(plan_estudio_params)
        format.html { redirect_to @plan_estudio, notice: 'Plan estudio was successfully updated.' }
        format.json { render :show, status: :ok, location: @plan_estudio }
      else
        format.html { render :edit }
        format.json { render json: @plan_estudio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /plan_estudios/1
  # DELETE /plan_estudios/1.json
  def destroy
    @plan_estudio.destroy
    respond_to do |format|
      format.html { redirect_to plan_estudios_url, notice: 'Plan estudio was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plan_estudio
      @plan_estudio = PlanEstudio.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def plan_estudio_params
      params.require(:plan_estudio).permit(:clave, :semestre, :inicio_vigencia, :fin_vigencia)
    end
end
