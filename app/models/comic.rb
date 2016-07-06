class Comic < ActiveRecord::Base
  before_validation :slug_url

  def slug_url
    unless self.url_slug
      self.url_slug = self.title.parameterize
    end
  end

  def self.first_comic
    self.all.order(:post_date).first
  end

  def self.latest_comic
    self.all.order(:post_date).last
  end

  def self.random_comic(current_comic)
    random_comic = Comic.all.sample
    until random_comic != current_comic
      random_comic = Comic.random_comic(current_comic)
    end
    random_comic
  end

  def self.next_comic(current_comic)
    Comic.where('post_date > ?', current_comic.post_date).first
  end

  def self.previous_comic(current_comic)
    Comic.where('post_date < ?', current_comic.post_date).last
  end
  
end