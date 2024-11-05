class Clinic < ApplicationRecord
  belongs_to :user

  include PgSearch::Model
  pg_search_scope :search_by_address,
  against: :address,
  using: {
    tsearch: { prefix: true }
  }
end
