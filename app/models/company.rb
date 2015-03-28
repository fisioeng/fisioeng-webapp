class Company < ActiveRecord::Base
	usar_como_cnpj :cnpj
	has_many :branches, dependent: :destroy
end
