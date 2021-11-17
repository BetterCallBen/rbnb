class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  has_many :games, dependent: :destroy, foreign_key: 'owner_id'
  has_many :reservations, dependent: :destroy, foreign_key: 'player_id'
  has_many :reviews, dependent: :destroy

  validates :pseudo, presence: true, uniqueness: true
  validates :phone_number, presence: true
  validates :phone_number, format: { with: /0[1-9]\d{8}/, message: "must be in 0xxxxxxxxx format." }
  validates :address, presence: true
end
