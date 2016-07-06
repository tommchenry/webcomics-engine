class ChangePostDateInComicsTable < ActiveRecord::Migration
  def up
    remove_column :comics, :post_date
    add_column :comics, :post_date, :datetime
  end

  def down
    remove_column :comics, :post_date
    add_column :comics, :post_date, :datetime
  end
end
