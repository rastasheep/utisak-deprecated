class NewsSerializer < BaseSerializer
  attributes :id, :title, :url, :domain, :author, :points, :comments_number, :can_vote, :created_at
  has_many :comments


  def author
#    if object.user
#     object.user.email
#    else
      "Anon"
#    end
  end

  def comments_number
    10
#    object.comments.count
  end

  def can_vote
    true
  end
end
