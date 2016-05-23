class AddUrlSlugToComics < ActiveRecord::Migration
  def change
    add_column :comics, :url_slug, :string
  end
end
