class AddDescriptionToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :description, :text
  end
end