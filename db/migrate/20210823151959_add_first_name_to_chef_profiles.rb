class AddFirstNameToChefProfiles < ActiveRecord::Migration[6.0]
  def change
    add_column :chef_profiles, :first_name, :string
  end
end
