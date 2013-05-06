class NewsController < ApplicationController
  before_filter :find_news, :except => [:index, :newest, :new]

  def index
    @news = News.by_hotness
  end

  def newest
    @news = News.by_date

    render :action => "index"
  end

  def new
  end

  def show
    @comments = @news.comments
    @comment = Comment.new
  end

  def vote
    @news.update_attributes(:points=> @news.points+1)

    redirect_to news_index_path
  end

  private

  def find_news
   @news = News.find(params[:id])
  end
end
