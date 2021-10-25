module Astronauts
  class List < ::PaginationService
    def self.call(page, per_page)
      new(page, per_page).call
    end

    def call
      { json: { pagination: create_pagin_object, astronauts: serialized_items, } }
    end

    def initialize(page, per_page)
      super(page, per_page, model)
    end

    def model
      Astronaut
    end

    def serialized_items
      ActiveModelSerializers::SerializableResource.new(paginated_items, each_serializer: AstronautSerializer)
    end
  end
end