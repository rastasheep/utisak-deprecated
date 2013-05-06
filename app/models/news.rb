class News < ActiveRecord::Base

  belongs_to :user

  has_many :comments, :dependent => :destroy

  attr_accessible :content, :points, :title, :url, :user

  validates :title, :user_id,  :presence => true
  validates :url, :uniqueness => true

  before_create :init

  scope :by_hotness, order("(points-1)/(((EXTRACT(EPOCH FROM current_timestamp - created_at)/3600) + 2)^ 1.5) DESC")

  scope :by_date, order("created_at DESC")

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
