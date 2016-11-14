class Admin::DashboardController < ApplicationController
  before_filter :authorize
  before_filter :publisher

  def index
    @comic = Comic.new
    @comics = Comic.order(post_date: :desc)
    @search = Comic.search(params[:q])
  end
end
