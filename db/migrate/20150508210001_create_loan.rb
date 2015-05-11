class CreateLoan < ActiveRecord::Migration
  def change
    create_table :loans do |t|
      t.references :user
      t.references :library
    end
  end
end
