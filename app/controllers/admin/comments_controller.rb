class Admin::CommentsController < Admin::BaseController

  helper_method :sort_column, :sort_direction, :search_params

  before_filter :find_comment, :only => [:edit, :update, :show, :destroy]

  def index
    @search = Comment.search(params[:search])
    @comments = find_comments
  end

  
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(params[:comment])
    if @comment.save
      redirect_to admin_comments_path, :notice => "Successfully created comment."
    else
      render :new
    end
  end
  
  def show
  end

  
  def edit
  end

  def update
    if @comment.update_attributes(params[:comment])
      redirect_to admin_comments_path, :notice => "Successfully updated comment."
    else
      render :edit
    end
  end
  
  def destroy
    @comment.destroy
    redirect_to admin_comments_path, :notice => "Comment has been deleted."
  end

  protected

  def find_comment
    @comment = Comment.find(params[:id])
  end

  def find_comments
    search_relation = @search.relation
    search_relation.order(sort_column + " " + sort_direction).page params[:page]
  end

  def sort_column
    Comment.column_names.include?(params[:sort]) ? params[:sort] : "created_at"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
  end

  def search_params
    {:search => params[:search]}
  end

end
