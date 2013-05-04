class CommentsController < ApplicationController
  before_filter :find_news

  def create
    comment = @news.comments.build(params[:comment])
    comment.user = current_user
    comment.save!

    redirect_to @news, :notice => "Comment added"
  end

  private

  def find_news
    @news = News.find(params[:news_id])
  end

end
