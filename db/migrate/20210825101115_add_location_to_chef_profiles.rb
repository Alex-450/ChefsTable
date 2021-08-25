class AddLocationToChefProfiles < ActiveRecord::Migration[6.0]
  def change
    add_column :chef_profiles, :location, :string
  end
end
