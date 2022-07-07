class Category < ApplicationRecord
  # status Concern
  include Status

  scope :roots, -> { where(parent_id: nil) }

  has_one_attached :image

  validates :name, presence: true
  validates :description, presence: true
  validates :url_key, uniqueness: true

  has_many :category_products, dependent: :destroy
  has_many :products, through: :category_products

  has_many :children, class_name: "Category", foreign_key: "parent_id"
  belongs_to :parent, class_name: "Category", optional: true

  before_validation :url_key_uniq

  protected
  def url_key_uniq
    if self.url_key.empty?
      self.url_key = name.downcase.gsub(/[^a-zA-z0-9\-]/, '-')
      end
    end


end
