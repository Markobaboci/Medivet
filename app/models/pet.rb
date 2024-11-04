class Pet < ApplicationRecord
  belongs_to :user
  validates :name, presence: true, length: { minimum: 2, maximum: 50 }
  validates :species, presence: true, inclusion: { in: %w[cat dog bird rabbit exotic], message: "%{value} is not a valid species" }
  validates :breed, presence: true, length: { minimum: 2, maximum: 50 }
  validates :age, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :weight, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :description, presence: true
  has_many :bookings, dependent: :destroy
end
