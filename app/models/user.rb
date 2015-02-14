class User < ActiveRecord::Base
  apply_simple_captcha
  devise :omniauthable
  has_many :comments
  has_many :likes
  has_many :actions

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:email],:omniauth_providers => [:github, :facebook]

  def self.create_with_omniauth( auth, signed_in_resource = nil )
    user = User.where( provider: auth.provider, uid: auth.uid.to_s ).first
    if user
      user
    else
      registered_user = User.where( email: auth.email ).first
      if registered_user
        registered_user
      else
        user=User.create(
            username: auth.info.name,
            provider: auth.provider,
            uid: auth.uid,
            email: auth.info.email,
            password: Devise.friendly_token[ 0, 20 ]
        )
      end
    end
  end

  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    if user
        return user
    else
        registered_user = User.where(:email => auth.info.email).first
        if registered_user
            return registered_user
        else
            user = User.create(username:auth.extra.raw_info.name,
                               provider:auth.provider,
                               uid:auth.uid,
                               email:auth.info.email,
                               password:Devise.friendly_token[0,20],
                              )
        end
    end
  end
end

