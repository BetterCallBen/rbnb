class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :games
  has_many :reservations
  has_many :reviews

  validates :name, presence: true
  validates :pseudo, presence: true, uniqueness: true
  validates :description, presence: true, length: { in: 5..400 }
  validates :phone_number, presence: true, format: { with: /(?<!\d)\d{10}(?!\d)/, message: "Phone number must be in 0xxxxxxxxx format." }
  validates :address, presence: true
end
