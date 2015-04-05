class CreateSamplings < ActiveRecord::Migration
  def change
    create_table :samplings do |t|
      t.references :analyte, index: true, foreign_key: true
      t.string :name

      t.timestamps null: false
    end
  end
end
