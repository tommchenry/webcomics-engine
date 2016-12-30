class FeedsController < ApplicationController
  layout false

  def rss
    @comics = Comic.where('visible = ?', true).order(:post_date).last(20)
  end

end
