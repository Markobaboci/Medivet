class CreatePets < ActiveRecord::Migration[7.2]
  def change
    create_table :pets do |t|
      t.string :name
      t.integer :age
      t.string :species
      t.string :breed
      t.float :weight
      t.text :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
