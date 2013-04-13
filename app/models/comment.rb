class Comment < ActiveRecord::Base

  belongs_to :news
  belongs_to :user

  attr_accessible :content

  validates :content, :presence => true

end
