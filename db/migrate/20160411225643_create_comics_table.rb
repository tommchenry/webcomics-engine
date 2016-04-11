class CreateComicsTable < ActiveRecord::Migration
  def change
    create_table :comics do |t|
      t.string :title
      t.string :img_url
      t.string :alt_text
      t.string :post_date

      t.timestamps
    end
  end
end
