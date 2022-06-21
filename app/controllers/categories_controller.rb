class CategoriesController < ApplicationController
  def show
    category_id = helpers.resolve_category_id(params[:id])
    @category = Category.find(category_id)
    @tree_data = helpers.tree_data
  end
end
