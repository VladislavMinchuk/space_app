module Api
  module V1
    class AstronautsController < ApplicationController

      def index
        @astronauts = Astronaut.order('created_at DESC')
        
        render json: @astronauts
      end
    end
  end
end