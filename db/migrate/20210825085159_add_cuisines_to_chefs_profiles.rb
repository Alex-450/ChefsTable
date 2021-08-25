class AddCuisinesToChefsProfiles < ActiveRecord::Migration[6.0]
  def change
    add_column :chef_profiles, :cuisines, :text, array: true, default: []
  end
end
