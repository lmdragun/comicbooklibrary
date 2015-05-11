class CreateCompany < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.integer :year_founded
      t.string :logo_url
    end
  end
end
