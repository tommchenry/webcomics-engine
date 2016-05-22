class Comic < ActiveRecord::Base

  def self.latest_comic
    self.all.order(post_date: :desc).first
  end

  def self.random_comic(current_comic)
    random_comic = Comic.all.sample
    until random_comic != current_comic
      random_comic = Comic.random_comic(current_comic)
    end
    random_comic
  end

end
