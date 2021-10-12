module Api
  module V1
    class AstronautsController < ApplicationController

      def index
        @astronauts = Astronaut.order('created_at DESC')
        
        render json: @astronauts
      end

      def create
        @astronaut = Astronaut.new(astronaut_params)

        if @astronaut.save
          render json: @astronaut, status: :created
        else
          render json: @user.errors, status: :unprocessable_entity
        end
      end

      def destroy
        astronaut_id = params[:id]
        @astronaut = Astronaut.find_by id: astronaut_id

        if @astronaut
          @astronaut.destroy
        else
          render json: { astronaut: "Astronaut with id='#{astronaut_id}' not found" }, status: :not_found
        end
      end

      def astronaut_params
        params.permit(:name, :country_id)
      end
    end
  end
end