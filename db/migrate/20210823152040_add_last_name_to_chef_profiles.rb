class AddLastNameToChefProfiles < ActiveRecord::Migration[6.0]
  def change
    add_column :chef_profiles, :last_name, :string
  end
end
