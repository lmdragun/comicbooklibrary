class CreateOwnership < ActiveRecord::Migration
  def change
    create_table :ownerships do |t|
      t.references :user
      t.references :comic
      t.string :location
      t.text :note
      t.boolean :favorite
      t.timestamps
    end
  end
end
