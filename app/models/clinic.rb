class Clinic < ApplicationRecord
  belongs_to :user
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :phone_numer, presence: true, uniqueness: true
  validates :webpage, presence: true, uniqueness: true, format: { with: URI::regexp(%w[http https]) }
  validates :address, presence: true, uniqueness: true
  validates :description, presence: true
  validates :species, presence: true, inclusion: { in: %w[cat dog bird rabbit exotic], message: "%{value} is not a valid species" }
  validates :logitude, presence: true, uniqueness: true, numericality: { greater_than_or_equal_to: -180, less_than_or_equal_to: 180 }
  validates :latitude, presence: true, uniqueness: true, numericality: { greater_than_or_equal_to: -90, less_than_or_equal_to: 90 }
  validates :rate, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :care_type, presence: true, inclusion: { in: %w[general emergency vaccination specialty], message: "%{value} is not a valid care type" }
end
