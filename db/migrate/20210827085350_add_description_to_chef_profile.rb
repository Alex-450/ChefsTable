class AddDescriptionToChefProfile < ActiveRecord::Migration[6.0]
  def change
    add_column :chef_profiles, :description, :text
  end
end
