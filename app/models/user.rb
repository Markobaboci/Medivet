class User < ApplicationRecord
  # Relationships and attachments
  has_many :pets, dependent: :destroy # Ensures a user has many pets
  has_one_attached :photo

  # Devise modules
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :clinics, dependent: :destroy
  has_many :bookings, through: :pets, dependent: :destroy
  has_many :reviews, through: :bookings
  # validates :first_name, presence: true, length: { minimum: 2, maximum: 50 }
  # validates :last_name, presence: true, length: { minimum: 2, maximum: 50 }
  # validates :address, presence: true
  # validates :longitude, presence: true, numericality: { greater_than_or_equal_to: -180, less_than_or_equal_to: 180 }
  # validates :latitude, presence: true, numericality: { greater_than_or_equal_to: -90, less_than_or_equal_to: 90 }
  # validates :user_name, presence: true, uniqueness: true, length: { minimum: 2, maximum: 50 }
  # validates :phone_number, presence: true, uniqueness: true

  # Validation
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  ROLES = %w[client vet]
  validates :role, inclusion: { in: ROLES }

  # Virtual attribute for the checkbox
  attr_accessor :is_vet

  # Callback
  before_validation :assign_role_based_on_checkbox

  # Check if a user needs to provide a full name
  def requires_full_name_for_booking?
      pets.bookings.exists || false
  end

  def vet?
    role == 'vet'
  end

  # Conditional validation for bookings
  validates :first_name, presence: true, if: :requires_full_name_for_booking?
  validates :last_name, presence: true, if: :requires_full_name_for_booking?

  private

  # Assign role based on the virtual `is_vet` attribute
  # checks if is_vet is "1" (value set by the checkbox) and then sets role to "vet"
  def assign_role_based_on_checkbox
    self.role = is_vet == "1" ? "vet" : "client"
  end
  # validates :vet , inclusion: { in: [true, false] }
end
