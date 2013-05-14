class News < ActiveRecord::Base

  belongs_to :user
  has_many :news_votes

  has_many :comments, :dependent => :destroy

  attr_accessible :content, :title, :url, :user

  validates :title, :user_id,  :presence => true
  validates :title, :url, :uniqueness => true

  before_create :init

  scope :by_date, order("created_at DESC")
  scope :by_hotness, order("(( SELECT COUNT(*) FROM news_votes WHERE news_votes.news_id = id) / (((EXTRACT(EPOCH FROM LOCALTIMESTAMP) - EXTRACT(EPOCH FROM created_at))/3600 + 2) ^ 1.8) )DESC")

  def points
    @points ||= self.news_votes.count
  end

  def hotness
    time = (Time.now - created_at)/3600
    (points / time+2**1.8)
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
