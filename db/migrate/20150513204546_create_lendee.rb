class CreateLendee < ActiveRecord::Migration
  def change
    create_table :lendees do |t|
      t.references :user
      t.references :loan
    end
  end
end
