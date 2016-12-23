class SchoolDistrictsController < ApplicationController
  before_action :set_school_district, only: [:show, :update, :destroy]

  # GET /school_districts
  # GET /school_districts.json
  def index
    @school_districts = SchoolDistrict.all
  end

  # GET /school_districts/1
  # GET /school_districts/1.json
  def show
  end

  # POST /school_districts
  # POST /school_districts.json
  def create
    @school_district = SchoolDistrict.new(school_district_params)

    if @school_district.save
      render :show, status: :created, location: @school_district
    else
      render json: @school_district.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /school_districts/1
  # PATCH/PUT /school_districts/1.json
  def update
    if @school_district.update(school_district_params)
      render :show, status: :ok, location: @school_district
    else
      render json: @school_district.errors, status: :unprocessable_entity
    end
  end

  # DELETE /school_districts/1
  # DELETE /school_districts/1.json
  def destroy
    @school_district.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_school_district
      @school_district = SchoolDistrict.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def school_district_params
      params.require(:school_district).permit(:name, :domain)
    end
end
