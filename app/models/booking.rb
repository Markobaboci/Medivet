class Booking < ApplicationRecord
  belongs_to :clinic
  belongs_to :pet
  has_one :review, dependent: :destroy  # Ensure only one review per booking

  validates :date, presence: true
  validates :time, presence: true
  validates :description, presence: true, length: { maximum: 300 }
  validates :species, presence: true,
                      inclusion: {
                        in: ['cat', 'dog', 'bird', 'small mammal', 'reptile/amphibian', 'farm animal', 'horse', 'fish', 'other/exotic'],
                        message: "%<value>s is not a valid species, must be one of: cat, dog, bird, small mammal, reptile/amphibian, farm animal, horse, fish, or other/exotic"
                      }

  validates :care_type, presence: true,
                        inclusion: {
                          in: ['other', 'emergency', 'vaccination', 'flea and tick', 'dental', 'surgery', 'microchipping', 'neutering', 'grooming', 'holistic', 'house calls', 'routine check', 'skin and ear infections', 'urinary problems', 'eye issues', 'diarrhea and vomiting', 'mobility concerns', 'trauma and injury', 'nutrition', 'toxin ingestion', 'x-ray', 'preventive care'],
                          message: "%<value>s is not a valid care type, must be one of: other, emergency, vaccination, flea and tick, dental, surgery, microchipping, neutering, grooming, holistic, house calls, routine check, skin and ear infections, urinary problems, eye issues, diarrhea and vomiting, mobility concerns, trauma and injury, nutrition, toxin ingestion, x-ray, or preventive care"
                        }
validates :first_name, presence: true
validates :last_name, presence: true
end
