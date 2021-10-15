class PaginationService
  def initialize(page, per_page, modelItem)
    @page = page || 1
    @per_page = per_page || 20
    @model = modelItem.page(page).per(per_page)
  end

  def create_pagin_object
    {
      current: @model.current_page,
      previous: prev_page,
      next: next_page,
      per_page: @per_page,
      pages: @model.total_pages,
      count: @model.total_count
    }
  end

  def next_page
    @model.current_page == @model.total_pages ? nil : @model.current_page.next
  end

  def prev_page
    @model.current_page > 1 ? @model.current_page.pred : nil
  end

  def items
    @model
  end
end