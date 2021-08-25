class RemoveCuisineFromChefProfiles < ActiveRecord::Migration[6.0]
  def change
    remove_column :chef_profiles, :cuisine
  end
end
