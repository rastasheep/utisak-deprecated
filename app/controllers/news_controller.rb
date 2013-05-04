class NewsController < ApplicationController
  before_filter :find_news, :except => [:index, :new]

  def index
    @news = News.all
  end

  def new
  end

  def show
    @comments = @news.comments
    @comment = Comment.new
  end

  private

  def find_news
   @news = News.find(params[:id])
  end
end
