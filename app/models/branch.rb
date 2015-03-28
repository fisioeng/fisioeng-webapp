class Branch < ActiveRecord::Base
  belongs_to :company
  has_many :analytes, dependent: :destroy
end
