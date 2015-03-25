class CreateBranches < ActiveRecord::Migration
  def change
    create_table :branches do |t|
      t.references :company, index: true, foreign_key: true
      t.string :alias
      t.string :cep
      t.string :number
      t.string :street_address
      t.string :neighborhood
      t.string :city
      t.string :uf
      t.string :country
      t.string :complement

      t.timestamps null: false
    end
  end
end
