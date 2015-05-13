class CreateLoan < ActiveRecord::Migration
  def change
    create_table :loans do |t|
      t.integer :lender_id
      t.integer :lendee_id
      t.references :ownership
      t.boolean :out
      t.timestamps
    end
  end
end
