class Review < ApplicationRecord
  belongs_to :booking
  belongs_to :user

  # Validation to ensure presence and rating range (0-5)
  validates :content, presence: true
  validates :rating, presence: true, inclusion: { in: 0..5, message: "must be between 0 and 5" }
end
