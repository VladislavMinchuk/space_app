class ApplicationController < ActionController::API
  def create_pagination_response(page, per_page, model)
    pagination = PaginationService.new(page, per_page, model)
    
    {
      pagination: pagination.create_pagin_object,
      items: pagination.items
    }
  end
end
