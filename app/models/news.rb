class News < ActiveRecord::Base

  belongs_to :user

  has_many :comments, :dependent => :destroy

  attr_accessible :content, :points, :title, :url

  validates :title, :user_id,  :presence => true
  validates :url, :uniqueness => true

  def domain
    if self.url.blank?
      nil
    else
      pu = URI.parse(self.url)
      pu.host.gsub(/^www\d*\./, "")
    end
  end

end
