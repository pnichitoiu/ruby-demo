class Category < ApplicationRecord
  # status Concern
  include Status

  has_one_attached :image

  validates :name, presence: true
  validates :description, presence: true

  has_many :category_products
  has_many :products, through: :category_products
  has_many :children, class_name: "Category", foreign_key: "parent_id"
  belongs_to :parent, class_name: "Category", optional: true
end
