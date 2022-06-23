class User < ApplicationRecord
  has_secure_password

  validates :first_name, presence: true, format: { with: /[a-zA-Z]/, message: "Only allows letters."}
  validates :last_name, presence: true, format: { with: /[a-zA-Z]/, message: "Only allows letters."}
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create, message: "Use a valid email address."}
  validates_uniqueness_of :email, message: "The email address exist."
  validates :phone_number, presence: true, length: { minimum: 10, message: "Phone Number must has 10 numerical characters."}, numericality: { only_integer: true }
  validates :password_digest, confirmation: true
  has_many :addresses, foreign_key: "users_id", dependent: :destroy

end