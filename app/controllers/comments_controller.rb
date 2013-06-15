class CommentsController < ApplicationController
  before_filter :authenticate_user!, :only => [:new, :create]
  before_filter :find_news

  def new
    @comment = @news.comments.build("parent_id"=>params[:parent_id], "news_id"=>params[:news_id])
  end

  def create
    comment = @news.comments.build(params[:comment])
    comment.user = current_user
    if comment.save
      redirect_to news_index_path, :notice => t(:'comments.added')
    else
      redirect_to news_path(@news), :alert =>  t(:'comments.failed')
    end
  end

  def show
    @comment = Comment.find(params[:id])
  end

  private

  def find_news
    @news = News.find(params[:news_id])
  end

end
