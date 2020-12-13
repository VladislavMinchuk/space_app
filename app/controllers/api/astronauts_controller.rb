module Api
  class AstronautsController < ApplicationController
    def index
      astronautList = Astronaut::AstronautList.new(params)
      
      render json: astronautList.list
    end

    def show
      render json: Astronaut.find(params[:id])
    end

    def create
      astronaut = Astronaut.create(astronaut_params)
      if astronaut.errors.any?
        return render json: { errors: astronaut.errors }
      end
      render json: astronaut
    end

    private

      def astronaut_params
        params.require(:astronaut).permit(:first_name, :last_name, :birthday, :country_id)
      end
  end
end