class ComicsController < ApplicationController

  def index
    @comic = Comic.all.order(:post_date).last
  end

  def show
  end
end


