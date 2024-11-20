class ChangeSpeciesAndCareTypeToArrays < ActiveRecord::Migration[7.2]
  def change
    # Alter species column to array
    change_column :clinics, :species, :string, array: true, default: [], using: "(string_to_array(species, ','))"

    # Alter care_type column to array
    change_column :clinics, :care_type, :string, array: true, default: [], using: "(string_to_array(care_type, ','))"
  end
end
