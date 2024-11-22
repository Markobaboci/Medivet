class Clinic < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch::Model
  pg_search_scope :search_by_address,
                  against: :address,
                  using: {
                    tsearch: { prefix: true }
                  }

  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :phone_numer, presence: true, uniqueness: true
  validates :webpage, presence: true, uniqueness: true,
                      format: { with: URI::DEFAULT_PARSER.make_regexp(%w[http https]) }
  validates :address, presence: true, uniqueness: true
  validates :description, presence: true
  validates :species, presence: true,
                    inclusion: { in: ['cat', 'dog', 'bird', 'small mammal', 'reptile/amphibian', 'farm animal', 'horse', 'fish', 'other/exotic'],
                                 message: "%<value>s is not a valid species, must be one of: cat, dog, bird, small mammal, reptile/amphibian, farm animal, horse, fish, or other/exotic" }

  # validates :logitude, presence: true, uniqueness: true, numericality: { greater_than_or_equal_to: -180, less_than_or_equal_to: 180 }
  # validates :latitude, presence: true, uniqueness: true, numericality: { greater_than_or_equal_to: -90, less_than_or_equal_to: 90 }
  validates :rate, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :care_type, presence: true,
                      inclusion: { in: ['other', 'emergency', 'vaccination', 'flea and tick', 'dental', 'surgery', 'microchipping', 'neutering', 'grooming', 'holistic', 'house calls', 'routine check', 'skin and ear infections', 'urinary problems', 'eye issues', 'diarrhea and vomiting', 'mobility concerns', 'trauma and injury', 'nutrition', 'toxin ingestion', 'x-ray', 'preventive care'],
                                   message: "%<value>s is not a valid care type, must be one of: other, emergency, vaccination, flea and tick, dental, surgery, microchipping, neutering, grooming, holistic, house calls, routine check, skin and ear infections, urinary problems, eye issues, diarrhea and vomiting, mobility concerns, trauma and injury, nutrition, toxin ingestion, x-ray, or preventive care" }

  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings

  def average_rating
    # Calculate the average rating from associated reviews
    review_average = reviews.average(:rating)&.round(1)

    # If there are no reviews, use the stored value_rate
    if review_average.nil?
      rate || '0' # Use value_rate if present, otherwise 'N/A'
    else
      review_average
    end
  end
end
