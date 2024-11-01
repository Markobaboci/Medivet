class Booking < ApplicationRecord
  belongs_to :clinic
  belongs_to :pet

  validates :date, presence: true
  validates :time, presence: true
  validates :description, presence: true, length: { maximum: 300 }
end
