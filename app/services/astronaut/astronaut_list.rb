# filtered_list and pagination_by_list - PaginatedFiltersService methods


class Astronaut

  class AstronautList < PaginatedFiltersService
    def initialize(params, serializer)
      @serializer = serializer
      # Call PaginatedFiltersService constructor
      super(Astronaut, astronaut_filters_params(params), params[:page], params[:per_page])
    end

    def list
      serialized = serializ_list(filtered_list, @serializer)
      {
        astronauts: serialized,
        paginatioin: pagination_by_list
      }
    end

    private

    def astronaut_filters_params(params)
      params.permit(:first_name, :last_name, :birthday, :country_id, :id)
    end

    def serializ_list(list, serializer)
      list.map{ |item| serializer.new(item) }
    end
    
  end

end