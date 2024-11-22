class AddSpeciesAndCareTypeToBookings < ActiveRecord::Migration[7.2]
  def change
    add_column :bookings, :species, :string
    add_column :bookings, :care_type, :string
  end
end
