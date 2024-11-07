class Clinic < ApplicationRecord
  belongs_to :user

  include PgSearch::Model
  pg_search_scope :search_by_address,
  against: :address,
  using: {
    tsearch: { prefix: true }
  }

  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :phone_numer, presence: true, uniqueness: true
  validates :webpage, presence: true, uniqueness: true, format: { with: URI::regexp(%w[http https]) }
  validates :address, presence: true, uniqueness: true
  validates :description, presence: true
  validates :species, presence: true, inclusion: { in: %w[cat dog bird rabbit exotic], message: "%{value} is not a valid species, must be either : cat, dog, bird, rabbit, or exotic" }
  # validates :logitude, presence: true, uniqueness: true, numericality: { greater_than_or_equal_to: -180, less_than_or_equal_to: 180 }
  # validates :latitude, presence: true, uniqueness: true, numericality: { greater_than_or_equal_to: -90, less_than_or_equal_to: 90 }
  validates :rate, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :care_type, presence: true, inclusion: { in: %w[general emergency vaccination specialty], message: "%{value} is not a valid care type, must be either : general, emergency, vaccination, or specialty" }
  has_many :bookings, dependent: :destroy
end