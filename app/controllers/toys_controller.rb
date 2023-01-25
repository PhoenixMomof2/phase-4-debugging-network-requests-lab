class ToysController < ApplicationController
  wrap_parameters format: []

  def index
    toys = Toy.all
    render json: toys
  end

  def create
    toy = Toys.create!(toy_params)
    render json: toy, status: :created
  end

  def update
    toy = Toy.find_by(id: params[:id])
    byebug
    if toy
      toy.update(toy_params)
      render json: toy, status: :accepted
    else
      render json: { error: "toy not found" }, status: :not_found
    end
  end

  def destroy
    toy = Toy.find_by(id: params[:id])
    if toy
      toy.destroy
      head :no_content
    else 
      render json: { error: "toy not found" }, status: :not_found
    end
  end

  private
  
  def toy_params
    params.permit(:name, :image, :likes)
  end

end
