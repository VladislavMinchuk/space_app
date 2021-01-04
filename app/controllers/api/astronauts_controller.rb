module Api
  class AstronautsController < ApplicationController
    def index
      astronaut_list = Astronaut::AstronautList.new(params, AstronautSerializer)

      render json: astronaut_list.list
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

  end
end