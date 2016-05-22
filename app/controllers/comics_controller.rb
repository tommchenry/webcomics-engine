class ComicsController < ApplicationController

  def index
    @comic = Comic.latest_comic
    @previous_comic = Comic.previous_comic(@comic)
    @random_comic = Comic.random_comic(@comic)
    @next_comic = nil
    @first_comic = Comic.first_comic
    @last_comic = nil
  end

  def show
    @comic = Comic.find(params[:id])
    @previous_comic = Comic.previous_comic(@comic)
    @random_comic = Comic.random_comic(@comic)
    @next_comic = Comic.next_comic(@comic)
    @first_comic = Comic.first_comic
    @last_comic = Comic.latest_comic
  end
end


