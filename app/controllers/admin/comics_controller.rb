class Admin::ComicsController < ApplicationController
  before_filter :authorize
  before_filter :publisher

  def index
    @search = Comic.search(params[:q])
    @comic = Comic.new
    @comics = Comic.order(post_date: :desc)
  end

  def create
    @comic = Comic.new(comic_params)
    if @comic.save
      flash[:notice] = "Comic Posted Successfully"
      flash[:color] = "valid"
    else
      flash[:notice] = "Comic Unable to Save"
      flash[:color] = "valid"
    end
    @comics = Comic.order(post_date: :desc)
    redirect_to '/admin/comics'
  end

  def show

  end

  def edit
    @search = Comic.search(params[:q])
    @comic = Comic.find(params[:id])
  end

  def update
    @search = Comic.search(params[:q])
    @comic = Comic.find(params[:id])
    @comic.update_attributes(comic_params)
    flash[:success] = "Comic updated!"
    redirect_to '/admin/comics'
  end

  def destroy
    Comic.find(params[:id]).destroy
    flash[:success] = "Comic deleted!"
    redirect_to '/admin/comics'
  end

  private
  
  def comic_params
    params.require(:comic).permit(:title, :alt_text, :img_url, :visible, :post_date, :keywords)
  end

end
