class NewsSerializer < BaseSerializer
  attributes :id, :title, :url, :domain, :points, :can_vote, :created_at
  has_many :comments

  def can_vote
    true
  end
end
