class Game < ApplicationRecord
  belongs_to :owner, class_name: "User"
  has_many :reviews, dependent: :destroy
  has_many :reservations, dependent: :destroy
  has_many_attached :photos

  validates :name, presence: true
  validates :number_of_players, presence: true, inclusion: { in: %w[1 1-2 2-4 2-5 2-6 7+] }
  validates :category, presence: true, inclusion: { in: %w[stratégie plateau dés cartes lettres créatif culture] }
  validates :description, presence: true, length: { in: 5..400 }
  validates :price, presence: true, numericality: { only_integer: true }, inclusion: { in: 1..20 }


end
