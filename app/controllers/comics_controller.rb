class ComicsController < ApplicationController

  def index
    @comics = Comic.order(post_date: :desc)
  end

  def show
    @comic = Comic.find_by(url_slug: params[:url_slug])
    @previous_comic = Comic.previous_comic(@comic)
    @random_comic = Comic.random_comic(@comic)
    @next_comic = Comic.next_comic(@comic)
    @first_comic = Comic.first_comic
    @last_comic = Comic.latest_comic
  end
end


