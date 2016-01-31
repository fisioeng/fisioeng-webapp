class Company < ActiveRecord::Base
	usar_como_cnpj :cnpj
  belongs_to :user
	has_many :branches, dependent: :destroy
end
