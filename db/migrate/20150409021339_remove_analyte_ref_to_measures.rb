class RemoveAnalyteRefToMeasures < ActiveRecord::Migration
  def change
    remove_reference :measures, :analyte, index: true, foreign_key: true
  end
end
