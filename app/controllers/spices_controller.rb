class SpicesController < ApplicationController
  def index
    render json: Spice.all, status: :ok
  end

  def create
    render json: Spice.create(spice_params), status: :created
  end

  def update
    spice = Spice.find_by(id: params[:id])
    render json: spice.update(spice_params), status: :ok
  end

  def destroy
    spice = Spice.find_by(id: params[:id])
    spice.destroy
    head :no_content, status: :destroyed
  end

  private

  def spice_params
    params.permit(:title, :image, :description, :notes, :rating)
  end
end