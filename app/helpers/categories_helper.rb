module CategoriesHelper
  def tree_data
    output = []
    Category.roots.each do |category|
      output << data(category)
    end
    output
  end

  def resolve_category_id(arg)
    category = Category.where(url_key: arg).select(:id).first
    category ? category.id : arg
  end

  private

  def data(category)
    children = []
    unless category.children.blank?
      category.children.each do |cat|
        children << data(cat)
      end
    end
    {name: category.name, url_key: category.url_key, children: children}
  end
end
