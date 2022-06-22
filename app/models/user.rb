class User < ApplicationRecord
  has_secure_password

  REGEX_PATTERN = /^(.+)@(.+)$/
  validates :first_name, presence: true, format: { with: /A[a-zA-Z]+\z/, message: "Only allows letters."}
  validates :last_name, presence: true, format: { with: /A[a-zA-Z]+\z/, message: "Only allows letters."}
  validates :email, presence: true, uniqueness: true
  validates :phone_number, presence: true, length: { minimum: 10}, numericality: { only_integer: true }
  validates :password_digest, confirmation: true
  has_many :addresses, foreign_key: "users_id", dependent: :destroy

end