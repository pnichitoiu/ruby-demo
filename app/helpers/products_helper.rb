module ProductsHelper
  def image_builder(product)
    if product.image.attached?
      product.image.variant(resize_and_pad: [300, 200])
    else
      image_path("product/placeholder.jpeg")
    end
  end
  def format_price(price)
    ('$' + price.to_s)
  end
end
