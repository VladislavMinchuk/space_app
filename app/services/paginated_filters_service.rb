# @model, @page, @per_page - from PaginationService class

class PaginatedFiltersService < PaginationService

  def initialize(model, filters_params, page, per_page)
    @filters_params = filters_params

    super(model, page, per_page)
  end

  def filtered_list
    @inner_filtered_model = @model.where(@filters_params).page(@page).per(@per_page)
  end

  def pagination_by_list
    paginatioin(@inner_filtered_model)
  end
  
end