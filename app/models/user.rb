class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
        :token_authenticatable

  devise :omniauthable

  has_many :news
  has_many :news_votes

  validates :email, :username, :presence => true
  validates_uniqueness_of :email


  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :username, :password, :password_confirmation, :remember_me

  has_and_belongs_to_many :roles

  def role?(role)
    return !!self.roles.find_by_name(role.to_s)
  end

  def make_admin
    self.roles << Role.admin
  end

  def revoke_admin
    self.roles.delete(Role.admin)
  end

  def admin?
    role?(:admin)
  end

  def total_votes
    NewsVote.joins(:news).where(news: {user_id: self.id}).count
  end

  def can_vote_for?(news)
    news_votes.build(news_id: news.id).valid?
  end

#  def self.find_for_facebook_oauth(access_token, signed_in_resource=nil)
#    data = access_token['info']
#    if user = User.find_by_email(data["email"])
#      user
#    else # Create a user with a stub password.
#      User.create!(:email => data["email"], :password => Devise.friendly_token[0,20])
#    end
#  end

end
