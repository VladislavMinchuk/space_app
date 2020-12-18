class Astronaut

  class AstronautList < PaginatedFiltersService
    def initialize(params)
      # Call PaginatedFiltersService constructor
      super(Astronaut, params, params[:page], params[:per_page])
    end

    def list
      {
        astronauts: filtered_list,
        paginatioin: pagination_by_list
      }
    end
    
  end

end