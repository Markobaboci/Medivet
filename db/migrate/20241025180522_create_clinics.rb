class CreateClinics < ActiveRecord::Migration[7.2]
  def change
    create_table :clinics do |t|
      t.string :email
      t.string :phone_numer
      t.string :webpage
      t.string :address
      t.string :description
      t.string :species
      t.float :logitude
      t.float :latitude
      t.float :rate
      t.string :care_type
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
