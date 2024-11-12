class User < ApplicationRecord
  has_many :pets, dependent: :destroy # Ensures a user has many pets

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable
  has_many :clinics
  # validates :first_name, presence: true, length: { minimum: 2, maximum: 50 }
  # validates :last_name, presence: true, length: { minimum: 2, maximum: 50 }
  # validates :address, presence: true
  # validates :longitude, presence: true, numericality: { greater_than_or_equal_to: -180, less_than_or_equal_to: 180 }
  # validates :latitude, presence: true, numericality: { greater_than_or_equal_to: -90, less_than_or_equal_to: 90 }
  # validates :user_name, presence: true, uniqueness: true, length: { minimum: 2, maximum: 50 }
  # validates :phone_number, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  ROLES = %w[client vet]
  validates :role, inclusion: { in: ROLES }
  # validates :vet , inclusion: { in: [true, false] }
end
