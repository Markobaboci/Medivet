class User < ApplicationRecord
  has_many :pets, dependent: :destroy # Ensures a user has many pets

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :clinics
end
