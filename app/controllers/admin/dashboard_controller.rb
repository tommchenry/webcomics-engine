class Admin::DashboardController < ApplicationController
  before_filter :authorize

  def index
    @comic = Comic.new
    @comics = Comic.order(post_date: :desc)
  end
end
