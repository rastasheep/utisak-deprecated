class NewsController < ApplicationController
  before_filter :authenticate_user!, :only => [:new, :vote]
  before_filter :find_news, :except => [:index, :newest, :new]

  def index
    @news = News.all.sort_by(&:hotness)
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
    vote = current_user.news_votes.new(news_id: params[:id])
    if vote.save
      redirect_to news_index_url, notice: "Thank you for voting."
    else
      redirect_to news_index_url, :alert => "Unable to vote, perhaps you already did."
    end
  end

  private

  def find_news
   @news = News.find(params[:id])
  end
end
