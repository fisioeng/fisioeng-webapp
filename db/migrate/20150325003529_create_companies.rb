class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :cnpj
      t.string :alias
      t.string :name
      t.string :logo
      t.string :description

      t.timestamps null: false
    end
  end
end
