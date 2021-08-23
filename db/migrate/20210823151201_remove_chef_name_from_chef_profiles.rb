class RemoveChefNameFromChefProfiles < ActiveRecord::Migration[6.0]
  def change
    remove_column :chef_profiles, :chef_name, :string
  end
end
