module Api
  class AstronautsController < ApplicationController
    def index
      render json: Astronaut::AstronautList.new(astronaut_filters_params).list
    end

    def show
      render json: Astronaut.find(params[:id])
    end

    def create
      astronaut = Astronaut.create(astronaut_params)
      
      result = astronaut.errors.any? ? { errors: astronaut.errors } : astronaut
      
      render json: result
    end
    
    def update
      astronaut = Astronaut.find(params[:id])
      astronaut.update(astronaut_params)

      result = astronaut.errors.any? ? { errors: astronaut.errors } : astronaut
      
      render json: result
    end

    private

    def astronaut_params
      params.require(:astronaut).permit(:first_name, :last_name, :birthday, :country_id)
    end

    def astronaut_filters_params
      params.permit(:first_name, :last_name, :birthday, :country_id, :id)
    end
  end
end