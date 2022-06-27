class Product < ApplicationRecord
  # status Concern
  include Status
  has_one_attached :image
  validates :name, presence: true
  validates :sku, presence: true, uniqueness: true
  validates :url_key, uniqueness: true
  validates :price, numericality: { greater_than: 0 }

  has_many :category_products, dependent: :destroy
  has_many :categories, through: :category_products
end
