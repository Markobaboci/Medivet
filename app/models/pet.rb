class Pet < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  validates :name, presence: true, length: { minimum: 2, maximum: 50 }
  validates :species, presence: true,
                    inclusion: { in: ['cat', 'dog', 'bird', 'small mammal', 'reptile/amphibian', 'farm animal', 'horse', 'fish', 'other/exotic'],
                                 message: "%<value>s is not a valid species, must be one of: cat, dog, bird, small mammal, reptile/amphibian, farm animal, horse, fish, or other/exotic" }
  # validates :breed, presence: true, length: { minimum: 2, maximum: 50 }
  validates :age, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :weight, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :description, presence: true
  has_many :bookings, dependent: :destroy
end
