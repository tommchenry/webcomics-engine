class ComicsController < ApplicationController

  def index
    @search = Comic.search(params[:q])
    if params[:q].nil?
      @comic = Comic.latest_comic
      @previous_comic = Comic.previous_comic(@comic)
      @random_comic = Comic.random_comic(@comic)
      @next_comic = Comic.next_comic(@comic)
      @first_comic = Comic.first_comic
      @last_comic = Comic.latest_comic
    else
      @comics = @search.result
      @searched_for = params[:q][:title_or_keywords_cont]
    end
  end

  def show
    @search = Comic.search(params[:q])
    @comics = @search.result
    @comic = Comic.find_by(url_slug: params[:url_slug])
    @previous_comic = Comic.previous_comic(@comic)
    @random_comic = Comic.random_comic(@comic)
    @next_comic = Comic.next_comic(@comic)
    @first_comic = Comic.first_comic
    @last_comic = Comic.latest_comic
  end


  def new
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
    render :action => :new
  end

  private

  def comic_params
    params.require(:comic).permit(:title, :alt_text, :img_url, :post_date)
  end
end


