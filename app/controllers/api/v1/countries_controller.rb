module Api
  module V1
    class CountriesController < ApplicationController

      def index
        @countries = Country.order('created_at DESC')

        render json: @countries
      end
    end
  end
end