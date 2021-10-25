class PaginationService
  PAGE = 1
  PER_PAGE = 20

  def initialize(page, per_page, modelItem)
    @page = page || PAGE
    @per_page = per_page || PER_PAGE
    @model = modelItem
  end

  def create_pagin_object
    {
      current: paginated_items.current_page,
      previous: prev_page,
      next: next_page,
      per_page: @per_page,
      pages: paginated_items.total_pages,
      count: paginated_items.total_count
    }
  end

  def next_page
    paginated_items.current_page == paginated_items.total_pages ? nil : paginated_items.current_page.next
  end

  def prev_page
    paginated_items.current_page > 1 ? paginated_items.current_page.pred : nil
  end

  def paginated_items
    @model.page(@page).per(@per_page)
  end
end