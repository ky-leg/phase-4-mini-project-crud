class SpicesController < ApplicationController

    #GET /spices 
  def index
    render json: spices
  end

    #POST /spices 
  def create 
    spice = Spice.create(spice_params)
    render json: spice, status: :created
  end

    #GET /spices/:id
  def show 
    spice = find_spice
  end

  #PATCH /spices/:id
  def update
    spice = find_spice
    spice.update(spice_params)
    render json: spice
  end

  #DELETE /spices/:id
  def destroy
    spice = find_spice
    spice.destroy
    head :no_content
  end

  private 

  def spices 
    Spice.all
  end

  def spice_params
    params.permit(:title, :image, :description, :notes, :rating)
  end

  def render_not_found_response
    render json: { error: "Spice not found" }, status: :not_found
  end

  def find_spice
    Spice.find(params[:id])
  end 
end
