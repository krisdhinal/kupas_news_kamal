class PagesController < ApplicationController
  def index
    @news = News.all.order(created_at: :desc)
    @latest_news = News.order(created_at: :desc).first
  end

  def contact
  end

  def about
  end

  def news_detail
  end
end
