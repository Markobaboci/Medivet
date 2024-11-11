class RenameLogitudeToLongitudeInClinics < ActiveRecord::Migration[7.2]
  def change
    rename_column :clinics, :logitude, :longitude
  end
end
