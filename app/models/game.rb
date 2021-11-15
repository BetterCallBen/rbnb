class Game < ApplicationRecord
  belongs_to :owner
  has_many :reviews
  has_many :reservations
end
