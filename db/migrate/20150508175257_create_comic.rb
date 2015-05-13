class CreateComic < ActiveRecord::Migration
  def change
    create_table :comics do |t|
      t.string :series
      t.integer :number
      t.integer :year
      t.string :creators
      t.references :company
      t.string :title
      t.string :date_published
      t.string :cover_img_url
    end
  end
end
