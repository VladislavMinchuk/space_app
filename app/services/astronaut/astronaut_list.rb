class Astronaut

  class AstronautList < PaginationService
    def initialize(params)
      @model = Astronaut

      super(@model, params[:page], params[:per_page])
    end

    def list
      {
        astronauts: pagin_list,
        paginatioin: paginatioin
      }
    end
  end

end