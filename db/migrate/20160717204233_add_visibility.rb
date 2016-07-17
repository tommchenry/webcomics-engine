class AddVisibility < ActiveRecord::Migration
  def change
    add_column :comics, :visible, :boolean, default: true
  end
end
