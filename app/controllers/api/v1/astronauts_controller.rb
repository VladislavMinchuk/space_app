module Api
  module V1
    class AstronautsController < ApplicationController

      def index
        astronauts = Astronaut.all

        pagination = create_pagination_response(astronaut_filters_params[:page], astronaut_filters_params[:per_page], astronauts)

        render json: {
          pagination: pagination[:pagination],
          astronauts: ActiveModelSerializers::SerializableResource.new(pagination[:items], each_serializer: AstronautSerializer),
        }
      end

      def show
        astronaut = Astronaut.find_by id: astronaut_id

        unless astronaut
          not_found_response
        else
          render json: astronaut
        end

      end

      def create
        @astronaut = Astronaut.new(astronaut_params)

        if @astronaut.save
          render json: @astronaut, status: :created
        else
          render json: @astronaut.errors, status: :unprocessable_entity
        end
      end

      def update
        astronaut = Astronaut.find_by id: astronaut_id
        astronaut.update_attributes astronaut_params

        render json: astronaut
      end

      def destroy
        @astronaut = Astronaut.find_by id: astronaut_id

        if @astronaut
          @astronaut.destroy
        else
          not_found_response
        end
      end

      def astronaut_params
        params.require(:astronaut).permit(:name, :country_id)
      end

      def astronaut_filters_params
        params.permit(:name, :country_id, :page, :per_page)
      end

      def astronaut_id
        params[:id]
      end

      def not_found_response
        render json: { astronaut: "Astronaut with id='#{astronaut_id}' not found" }, status: 404
      end
    end
  end
end