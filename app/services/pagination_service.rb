class PaginationService

  def initialize(model, page, per_page)
    @page = page || 1           # Default
    @per_page = per_page || 5   # Default
    @model = model
  end

  # Get list without filtering, with pagination only
  def pagin_list
    @inner_model = @model.page(@page).per(@per_page)
  end

  def paginatioin(outside_model)
    paginatioin_model = outside_model || @inner_model

    {
      current_page: paginatioin_model.current_page,
      prev_page: paginatioin_model.prev_page,
      next_page: paginatioin_model.next_page,
      total_pages: paginatioin_model.total_pages
    }
  end
end