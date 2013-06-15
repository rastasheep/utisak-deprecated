class NewsController < ApplicationController
  before_filter :authenticate_user!, :only => [:new, :vote]
  before_filter :find_news, :except => [:index, :newest, :new, :create]

  def index
    news = News.all.sort_by(&:hotness).reverse
    @news = Kaminari.paginate_array(news).page(params[:page])
  end

  def newest
    @news = News.by_date.page(params[:page])

    render :action => "index"
  end

  def new
    @news = current_user.news.build
  end

  def create
    @news = current_user.news.build params[:news]
    if @news.save
      redirect_to news_index_path, :notice => t(:'news.added')
    else
      render :new, :alert => t(:'news.failed')
    end
  end

  def show
    @comments = @news.comments
    @comment = Comment.new
  end

  def vote
    vote = current_user.news_votes.new(news_id: params[:id])
    if vote.save
      redirect_to news_index_url, notice: t(:'news.vote.added')
    else
      redirect_to news_index_url, :alert => t(:'news.vote.failed')
    end
  end

  private

  def find_news
   @news = News.find(params[:id])
  end
end
