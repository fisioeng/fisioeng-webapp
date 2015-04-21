class Sampling < ActiveRecord::Base
  belongs_to :analyte

  has_many :measures, dependent: :destroy
end
