class CreateChefProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :chef_profiles do |t|
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
