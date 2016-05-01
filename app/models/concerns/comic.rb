class Comic < ActiveRecord::Base

  def self.latest_comic
    self.all.order(:post_date).last
  end
end
