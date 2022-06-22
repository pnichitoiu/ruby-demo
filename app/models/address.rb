class Address < ApplicationRecord

  validates :first_name, presence: true, format: { with: /[a-zA-Z]/, message: "Only allows letters."}
  validates :last_name, presence: true, format: { with: /[a-zA-Z]/, message: "Only allows letters."}
  validates :street, presence: true
  validates :city, presence: true, format: { with: /[a-zA-Z]/, message: "Only allows letters."}
  validates :country, presence: true, format: { with: /[a-zA-Z]/, message: "Only allows letters."}
  validates :zip, format: { with: /[1-9]/, message: "Zip must be only numeric." }, length: { maximum: 6 , message: "Zip must has maximum 6 numerical characters."}
  belongs_to :user, foreign_key: "users_id"
end
