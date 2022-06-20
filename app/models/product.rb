class Product < ApplicationRecord
  # status Concern
  include Status
  has_one_attached :image
  validates :name, presence: true
  validates :sku, presence: true, uniqueness: true
  validates :price, numericality: { only_integer: true }
  has_many :category_products
  has_many :categories, through: :category_products
end
