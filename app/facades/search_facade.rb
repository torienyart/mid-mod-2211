class SearchFacade
  def initialize(params)
    @search_query = params[:q]
  end

  def service
    FoodService.new
  end

  def returned_foods
    json = service.ingredient_search(@search_query)
    json[:data].map do |food_data|
      Food.new(food_data)
    end
  end
end