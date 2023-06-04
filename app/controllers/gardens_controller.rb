class GardensController < ApplicationController
  def index
    @gardens = Garden.all
  end

  def show
    @garden = Garden.find(params[:id])
    @plant = Plant.new
  end

  def new
    @garden = Garden.new
  end

  def create
    @garden = Garden.new(garde_params)
    if @garden.save
      redirect_to gardens_path
    else
      render :new
    end
  end

  private

  def garde_params
    params.require(:garden).permit(:name, :image_url)
  end
end
