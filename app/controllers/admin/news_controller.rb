class Admin::NewsController < Admin::BaseController

  helper_method :sort_column, :sort_direction, :search_params

  before_filter :find_news, :only => [:edit, :update, :show, :destroy]

  def index
    @search = News.search(params[:search])
    search_relation = @search.relation
    @news = search_relation.order(sort_column + " " + sort_direction).page params[:page]
  end

  def new
    @news = News.new
  end

  def create
    @news = News.new(params[:news])
    if @news.save
      redirect_to admin_news_path, :notice => "Successfully created news."
    else
      render :new
    end
  end

  def show
  end


  def edit
  end

  def update
    if @news.update_attributes(params[:news])
      redirect_to admin_news_path, :notice => "Successfully updated news."
    else
      render :edit
    end
  end

  def destroy
    @news.destroy
    redirect_to admin_news_path, :notice => "News has been deleted."
  end

  protected

  def find_news
    @news = News.find(params[:id])
  end

  def sort_column
    News.column_names.include?(params[:sort]) ? params[:sort] : "created_at"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
  end

  def search_params
    {:search => params[:search]}
  end

end
