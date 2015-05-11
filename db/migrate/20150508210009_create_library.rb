class CreateLibrary < ActiveRecord::Migration
  def change
    create_table :libraries do |t|
      t.references :user
      t.references :comic
      t.text :note
      t.boolean :wishlist
      t.timestamps
    end
  end
end
