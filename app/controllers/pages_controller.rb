class PagesController < ApplicationController
  def index
    if params[:category_id].present?
      @category = Category.find(params[:category_id])
      @news = News.where(category_id: @category.id)
    else
      @category = nil
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
