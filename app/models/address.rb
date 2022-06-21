class Address < ApplicationRecord

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :street, presence: true
  validates :city, presence: true
  validates :country, presence: true
  validates :zip, numericality: { only_integer: true }
  belongs_to :user
end
