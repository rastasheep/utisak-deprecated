class News < ActiveRecord::Base

  belongs_to :user

  has_many :comments, :dependent => :destroy

  attr_accessible :content, :domain, :points, :title, :url

  validates :title, :presence => true
  validates :url, :presence => true, :uniqueness => true

end
