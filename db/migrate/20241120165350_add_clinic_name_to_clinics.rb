class AddClinicNameToClinics < ActiveRecord::Migration[7.2]
  def change
    add_column :clinics, :clinic_name, :string
  end
end
