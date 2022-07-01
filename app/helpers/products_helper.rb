module ProductsHelper
  def image_builder(product)
    if product.image.attached?
      product.image.variant(resize_to_limit: [300, 450], format: :jpeg, saver: { subsample_mode: "on", strip: true, quality: 80 })
    else
      "https://dummyimage.com/450x300/dee2e6/6c757d.jpg"
    end
  end
  def format_price(price)
    ('$'+price.to_s)
  end
end
