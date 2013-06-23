class NewsVote < ActiveRecord::Base

  include AnalyticScopes

  attr_accessible :news_id, :user_id

  belongs_to :news
  belongs_to :user

  validates :news_id, :uniqueness => {:scope => :user_id}
  validate :ensure_not_author

  def ensure_not_author
    errors.add :user_id, "is author of that news" if news.user_id == user_id
  end
end
