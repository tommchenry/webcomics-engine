class ComicsController < ApplicationController

  def index
    @comics = Comic.all.order(post_date: :desc)
    @comic = @comics.first
    @previous_comic = @comics.second
    @random_comc = Comic.random_comic(@comic)
    @next_comic = nil
    @first_comic = @comics.last
    @last_comic = nil
  end

  def show
    @comic = Comic.find(params[:id])
  end
end


