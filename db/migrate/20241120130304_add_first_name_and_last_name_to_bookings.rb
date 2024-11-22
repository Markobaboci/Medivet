class AddFirstNameAndLastNameToBookings < ActiveRecord::Migration[7.2]
  def change
    add_column :bookings, :first_name, :string
    add_column :bookings, :last_name, :string
  end
end
