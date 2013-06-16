class News < ActiveRecord::Base

  VALID_URL_REGEX = /^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/ix

  belongs_to :user
  has_many :news_votes

  has_many :comments, :dependent => :destroy

  attr_accessible :content, :title, :url, :user, :points

  validates :title, :user_id,  :presence => true
  validates :title, :url, :uniqueness => true, :allow_blank => true
  validates :url, presence: true, format: { with: VALID_URL_REGEX }

  before_create :init

  scope :by_date, order("created_at DESC")
  scope :by_hotness, order("(( SELECT COUNT(*) FROM news_votes WHERE news_votes.news_id = id) / (((EXTRACT(EPOCH FROM LOCALTIMESTAMP) - EXTRACT(EPOCH FROM created_at))/3600 + 2) ^ 1.8) )DESC")

  def self.hotness
    find_by_sql(%Q{(SELECT *,
                    points / (((EXTRACT(EPOCH FROM LOCALTIMESTAMP) - EXTRACT(EPOCH FROM created_at))/3600 + 2) ^ 1.8)
                    AS score
                    FROM news
                    ORDER BY score DESC)})
  end

  def vote!
    update_attributes(:points => self.points + 1)
  end

  private

  def init
    if self.url.blank?
      self.domain = nil
    else
      pu = URI.parse(self.url)
      self.domain = pu.host.gsub(/^www\d*\./, "")
    end
    self.points = 1
  end

end
