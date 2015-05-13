class CreateLender < ActiveRecord::Migration
  def change
    create_table :lenders do |t|
      t.references :user
      t.references :loan
    end
  end
end
