class CreateComic < ActiveRecord::Migration
  def change
    create_table :comics do |t|
      t.string :title
      t.integer :number
      t.string :creators
      t.string :date_published
      t.integer :year
      t.string :series
      t.references :company
      t.string :cover_img_url
    end
  end
end
