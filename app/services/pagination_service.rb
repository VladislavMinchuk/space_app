class PaginationService

  def initialize(model, page, per_page)
    @page = page || 1           # Default
    @per_page = per_page || 5   # Default
    @model = model
  end

  def pagin_list
    @model.page(@page).per(@per_page)
  end

  def paginatioin
    {
      current_page: pagin_list.current_page,
      prev_page: pagin_list.prev_page,
      next_page: pagin_list.next_page,
      total_pages: pagin_list.total_pages
    }
  end
end