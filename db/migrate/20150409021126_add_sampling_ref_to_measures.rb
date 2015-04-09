class AddSamplingRefToMeasures < ActiveRecord::Migration
  def change
    add_reference :measures, :sampling, index: true, foreign_key: true
  end
end
