module Api
  class AstronautsController < ApplicationController
    def index
      render json: Astronaut.order('created_at DESC')
    end
  end
end