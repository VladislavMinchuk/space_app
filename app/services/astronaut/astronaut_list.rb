class Astronaut

  class AstronautList < FiltersService
    def initialize(params)
      super(Astronaut, astronaut_filters_params(params), params[:page], params[:per_page])
    end

    def list
      {
        astronauts: filtered_list,
        paginatioin: pagination_by_list
      }
    end

    def astronaut_filters_params(params)
      params.permit(:first_name, :last_name, :birthday, :country_id, :id)
    end
  end

end