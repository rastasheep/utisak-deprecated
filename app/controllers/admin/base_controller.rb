class Admin::BaseController < ApplicationController

  before_filter :require_admin
  layout "admin"

  def index
    @overall_stats = {:registered_users => User.count,
                      :news => News.count,
                      :comments => Comment.count,
                      :votes => NewsVote.count}
    @daily_stats = {:registered_users => User.created_today.count,
                    :news => News.created_today.count,
                    :comments => Comment.created_today.count,
                    :votes => NewsVote.created_today.count}
  end

  protected

  def require_admin
    unless current_user.try(:admin?)
      render404 and return false
    end
  end

end
