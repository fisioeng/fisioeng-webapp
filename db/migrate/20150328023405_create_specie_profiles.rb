class CreateSpecieProfiles < ActiveRecord::Migration
  def change
    create_table :specie_profiles do |t|
      t.string :especiename
      t.string :alias
      t.text :description
      t.integer :min_temperature
      t.integer :max_temperature
      t.integer :min_surface_temperature
      t.integer :max_surface_temperature
      t.integer :min_heart_frequency
      t.integer :min_relative_humidity
      t.integer :max_relative_humidity

      t.timestamps null: false
    end
  end
end
