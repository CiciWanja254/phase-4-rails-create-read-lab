class PlantsController < ApplicationController
    def index
      plants = Plant.all
      render json: plants
    end
  
    def show
      plant = Plant.find(params[:id])
      render json: plant
    end
  
    def create
      plant = Plant.new(plant_params)
      if plant.save
        render json: plant, status: :created
      else
        render json: { errors: plant.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    private
  
    def plant_params
      params.permit(:name, :image, :price)
    end
  end
  