class AddMyFiledToMeasure < ActiveRecord::Migration
  def change
    add_column :measures, :serie, :string
    add_column :measures, :serie_label, :string
  end
end
