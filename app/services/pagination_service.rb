class PaginationService

  def initialize(page, per_page, model = nil)
    @page = page || 1           # Default
    @per_page = per_page || 5   # Default
    @model = model
  end

  # List without filtering, only pagination
  def pagin_list
    @model.page(@page).per(@per_page)
  end

  def paginatioin(outside_model)
    paginatioin_model = outside_model || pagin_list

    {
      current_page: paginatioin_model.current_page,
      prev_page: paginatioin_model.prev_page,
      next_page: paginatioin_model.next_page,
      total_pages: paginatioin_model.total_pages
    }
  end
end