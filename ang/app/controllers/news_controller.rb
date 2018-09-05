class NewsController < ApplicationController
  def index
    @main_news = News.find_by_default(true)
    @all_news = News.where("`default` <> true").order("updated_at DESC").page(params[:page]).per(12)
    @all_news_arr = @all_news.each_slice(3).to_a
  end

  def show
    @news = News.find_by_permalink(params[:permalink])
    if @news.nil?
      flash[:error] = "Cannot find the News !"
      redirect_to news_path
    end
  end
end
