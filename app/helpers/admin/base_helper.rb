module Admin::BaseHelper

  TIME_RANGE = 6.days.ago..Time.now

  def all_users
    User.group_by_day(:created_at, Time.zone, TIME_RANGE).count
  end

  def all_news
    News.group_by_day(:created_at, Time.zone, TIME_RANGE).count
  end

  def all_comments
    Comment.group_by_day(:created_at, Time.zone, TIME_RANGE).count
  end

end
