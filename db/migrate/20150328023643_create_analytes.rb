class CreateAnalytes < ActiveRecord::Migration
  def change
    create_table :analytes do |t|
      t.references :branch, index: true, foreign_key: true
      t.references :specie_profile, index: true, foreign_key: true
      t.integer :code
      t.string :name
      t.date :birthdate
      t.integer :weight
      t.string :lanado
      t.string :color

      t.timestamps null: false
    end
  end
end
