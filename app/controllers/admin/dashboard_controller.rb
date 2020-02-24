class Admin::DashboardController < ApplicationController
  before_action :authorize
  before_action :publisher

  def index
    @comic = Comic.new
    @comics = Comic.order(post_date: :desc)
    @search = Comic.search(params[:q])
  end
end
