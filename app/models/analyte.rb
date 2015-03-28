class Analyte < ActiveRecord::Base
  belongs_to :branch
  belongs_to :specie_profile
  has_many :measures, dependent: :destroy
end
