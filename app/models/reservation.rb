class Reservation < ApplicationRecord
  belongs_to :player
  belongs_to :game

  validates :date, presence: true
end
