class CreateLoan < ActiveRecord::Migration
  def change
    create_table :loans do |t|
      t.references :lender_id
      t.references :lendee_id
      t.references :comic
    end
  end
end
