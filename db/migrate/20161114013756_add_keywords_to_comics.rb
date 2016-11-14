class AddKeywordsToComics < ActiveRecord::Migration
  def change
    add_column :comics, :keywords, :string, default: ""
  end
end
