class SchoolsController < ApplicationController
  before_action :set_school, only: [:show, :update, :destroy]

  # GET /schools
  # GET /schools.json
  def index
    @schools = School.all
  end

  # GET /schools/1
  # GET /schools/1.json
  def show
  end

  # POST /schools
  # POST /schools.json
  def create
    @school = School.new(school_params)

    if @school.save
      render :show, status: :created, location: @school
    else
      render json: @school.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /schools/1
  # PATCH/PUT /schools/1.json
  def update
    if @school.update(school_params)
      render :show, status: :ok, location: @school
    else
      render json: @school.errors, status: :unprocessable_entity
    end
  end

  # DELETE /schools/1
  # DELETE /schools/1.json
  def destroy
    @school.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_school
      @school = School.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def school_params
      params.require(:school).permit(:name)
    end
end
