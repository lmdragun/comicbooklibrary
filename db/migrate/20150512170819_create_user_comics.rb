class CreateUserComics < ActiveRecord::Migration
  def change
    create_table :user_comics do |t|
      t.references :user
      t.references :comic
      t.string :location
      t.text :note
      t.boolean :favorite
    end
  end
end
