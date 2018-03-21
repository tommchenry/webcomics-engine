# == Schema Information
#
# Table name: comics
#
#  id                 :integer          not null, primary key
#  title              :string
#  alt_text           :string
#  created_at         :datetime
#  updated_at         :datetime
#  url_slug           :string
#  post_date          :datetime
#  visible            :boolean          default(TRUE)
#  keywords           :string           default("")
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#

class Comic < ActiveRecord::Base
  before_validation :slug_url, :ensure_post_date
  validates :title, presence: true

  #Paperclip
  has_attached_file :image,
    styles: {
    :thumb => "100x100#"
    },
    :convert_options => {
      :thumb => "-quality 75 -strip" 
    }

  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  def slug_url
    unless self.url_slug
      self.url_slug = self.title.parameterize
    end
  end

  def ensure_post_date
    unless self.post_date
      self.post_date = Time.now
    end
  end

  def self.first_comic
    self.where(visible: true).order(:post_date).first
  end

  def self.latest_comic
    self.where(visible: true).order(:post_date).last
  end

  def self.random_comic(current_comic)
    random_comic = Comic.where(visible: true).sample
    until random_comic != current_comic
      random_comic = Comic.random_comic(current_comic)
    end
    random_comic
  end

  def self.next_comic(current_comic)
    Comic.
      where('visible = ?', true).
      where('post_date > ?', current_comic.post_date).
      order(:post_date).
      first

  end

  def self.previous_comic(current_comic)
    Comic.
      where('visible = ?', true).
      where('post_date < ?', current_comic.post_date).
      order(:post_date).
      last
  end
end
