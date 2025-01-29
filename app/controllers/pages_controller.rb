class PagesController < ApplicationController
  def index
    @categories = Category.all
    if params[:category_id].present?
      @news = News.where(category_id: params[:category_id])
    else
      @news = News.all.order(created_at: :desc)
    end
    @latest_news = News.order(created_at: :desc).first
  end

  def contact
  end

  def about
  end

  def news_detail
  end
end
