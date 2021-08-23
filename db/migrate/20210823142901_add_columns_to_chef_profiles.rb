class AddColumnsToChefProfiles < ActiveRecord::Migration[6.0]
  def change
    add_column :chef_profiles, :chef_name, :string
    add_column :chef_profiles, :cuisine, :string
    add_column :chef_profiles, :location, :string
  end
end
