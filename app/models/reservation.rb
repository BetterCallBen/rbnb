class Reservation < ApplicationRecord
  belongs_to :player, class_name: "User"
  belongs_to :game

  validates :date, presence: true
end
