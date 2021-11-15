class Review < ApplicationRecord
  belongs_to :user
  belongs_to :game

  validates :comment, presence: true, length: { in: 5..400 }
  validates :rating, presence: true, numericality: { only_integer: true },
                     inclusion: { in: 0..5 }

end
