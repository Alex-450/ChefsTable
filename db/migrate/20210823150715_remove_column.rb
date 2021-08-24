class RemoveColumn < ActiveRecord::Migration[6.0]
  def change
    remove_column :chef_profiles, :chef_name
  end
end
