class News < ActiveRecord::Base

  belongs_to :user
  has_many :news_votes

  has_many :comments, :dependent => :destroy

  attr_accessible :content, :title, :url, :user

  validates :title, :user_id,  :presence => true
  validates :url, :uniqueness => true

  before_create :init

  scope :by_date, order("created_at DESC")

  def points
    @points ||= self.news_votes.count
  end

  def hotness
    time = (Time.now - created_at)/3600
    (points / time+2**1.5).ceil
  end

  private

  def init
    if self.url.blank?
      self.domain = nil
    else
      pu = URI.parse(self.url)
      self.domain = pu.host.gsub(/^www\d*\./, "")
    end

  end

end
