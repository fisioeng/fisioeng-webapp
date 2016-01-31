class AddForeignKey < ActiveRecord::Migration
  def change
    add_reference :companies, :user, index: true, foreign_key: true
  end
end
