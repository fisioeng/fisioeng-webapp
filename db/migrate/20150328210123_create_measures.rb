class CreateMeasures < ActiveRecord::Migration
  def change
    create_table :measures do |t|
      t.references :analyte, index: true, foreign_key: true
      t.float :value
      t.string :unit
      t.datetime :dateandtime

      t.timestamps null: false
    end
  end
end
