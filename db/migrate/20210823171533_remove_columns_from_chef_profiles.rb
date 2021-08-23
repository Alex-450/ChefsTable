class RemoveColumnsFromChefProfiles < ActiveRecord::Migration[6.0]
  def change
    remove_column :chef_profiles, :first_name
    remove_column :chef_profiles, :last_name
  end
end
