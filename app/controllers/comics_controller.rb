class ComicsController < ApplicationController

  def index
    #treat it as an array
    @comics = Comic.all.order(:post_date)
    @comic = @comics.last
  end

  def show
    @comic = Comic.find(params[:id])
  end
end


