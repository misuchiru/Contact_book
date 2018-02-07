class DistrictsController < ApplicationController
  before_action :find_district, only: [:edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :admin_required

  def index
    @districts = District.all
  end

  def new
    @district = District.new
  end

  def create
    @district = District.new(district_params)
    if @district.save
      redirect_to districts_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @district.update(district_params)
      redirect_to districts_path
    else
      render :edit
    end
  end

  def destroy
    @district.destroy if @district
    redirect_to districts_path
  end

  private
  def find_district
    @district = District.find_by(id: params[:id])
  end

  def district_params
    params.require(:district).permit(:title, :chapter_id)
  end
end
