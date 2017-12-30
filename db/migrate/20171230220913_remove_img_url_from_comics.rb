class RemoveImgUrlFromComics < ActiveRecord::Migration
  def change
    remove_column :comics, :img_url
  end
end
