class Review < ApplicationRecord
  belongs_to :user
  belongs_to :game

  validates :comment, presence: true, lenght: { in: 5..400 }
  validates :rating, presence: true, numericality: { only_integer: true },
                     inclusion: { in: 0..5 },
                     message: "Must be between 0 and 5"
end
