class CategoriesController < ApplicationController
  def show
    begin
      @category = Category.find( helpers.resolve_category_id(params[:id]))
      @products = @category.products.page(params[:page]).per(Kaminari.config.default_per_page)
    rescue ActiveRecord::RecordNotFound
      render 'errors/not_found', status: :not_found
    end
  end
  def index
    @products = Product.all.page(params[:page]).per(Kaminari.config.default_per_page)
  end
end
