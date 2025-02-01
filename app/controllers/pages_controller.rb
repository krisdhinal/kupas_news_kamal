class PagesController < ApplicationController
  def index
    if params[:category_id].present?
      @category = Category.find(params[:category_id])
      @news = News.where(category_id: @category.id)
      @latest_news = nil # Tidak ada latest news jika kategori dipilih
    else
      @category = nil
      @news = News.all.order(created_at: :desc)
      @latest_news = News.order(created_at: :desc).first
    end

    if params[:s].present?
      search_query = params[:s]
      @news = @news.where("LOWER(title) LIKE ?", "%#{search_query}%")
    end
  end

  def contact
  end

  def about
  end

  def news_detail
  end
end
