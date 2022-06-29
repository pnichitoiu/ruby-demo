class CategoriesController < ApplicationController
  def show
    begin
      @category = Category.find( helpers.resolve_category_id(params[:id]))
    rescue ActiveRecord::RecordNotFound
      render 'errors/not_found', status: :not_found
    end
  end
  def index
    @products = Product.all
  end
end
