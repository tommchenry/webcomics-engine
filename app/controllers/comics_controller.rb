class ComicsController < ApplicationController

  def index
    @comic = Comic.all.order(:post_date).last
  end

  def show
    @comic = Comic.find(params[:id])
  end
end


