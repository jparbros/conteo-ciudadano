class User < ActiveRecord::Base

  #
  # Associations
  #
  has_many :authentications

  #
  # Devise modules
  #
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable

  #
  # Attributes accessor
  #
  attr_accessible :email, :password, :password_confirmation, :remember_me
  cattr_accessor :current

  def apply_omniauth(omniauth)
    case omniauth['provider']
    when 'facebook'
      self.apply_facebook(omniauth)
    when 'twitter'
      self.apply_twitter(omniauth)
    end
    authentications.build(hash_from_omniauth(omniauth))
    save!
  end

  def facebook
    @fb_user ||= FbGraph::User.me(self.authentications.find_by_provider('facebook').token)
  end

  def twitter
    unless @twitter_user
      provider = self.authentications.find_by_provider('twitter')
      @twitter_user = Twitter::Client.new(:oauth_token => provider.token, :oauth_token_secret => provider.secret) rescue nil
    end
    @twitter_user
  end

  protected

  def apply_facebook(omniauth)
    if (extra = omniauth['extra']['user_hash'] rescue false)
      self.email = (extra['email'] rescue '')
    end
  end

  def apply_twitter(omniauth)
    if (extra = omniauth['extra']['user_hash'] rescue false)
      # Example fetching extra data. Needs migration to User model:
      # self.firstname = (extra['name'] rescue '')
    end
  end

  def hash_from_omniauth(omniauth)
    {
      :provider => omniauth['provider'],
      :uid => omniauth['uid'],
      :token => (omniauth['credentials']['token'] rescue nil),
      :secret => (omniauth['credentials']['secret'] rescue nil)
    }
  end
end
