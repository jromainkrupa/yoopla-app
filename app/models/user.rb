class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  devise :omniauthable, omniauth_providers: [:facebook]

  has_one :program
  acts_as_taggable_on :best_cigarettes

  BEST_CIGARETTES_TAGS = ["after_wake_up","after_breakfast",
                          "morning_break","before_lunch",
                          "after_lunch","afternoon_break",
                          "after_work","before_diner",
                          "after_dinner","before_bed"]

  STATUS = ["smoker_setup","invite_a_friend"]

  # validate :best_cigarettes
  validates :average_cigarettes_per_day, inclusion: { in: (3..60), allow_nil: true}
  validates :status, inclusion: { in: STATUS, allow_nil: true }

  def self.find_for_facebook_oauth(auth)
    # conversion part of the auth hash
    user_params = auth.slice("provider", "uid")
    user_params.merge! auth.info.slice("email", "first_name", "last_name")
    user_params[:facebook_picture_url] = auth.info.image
    user_params[:token] = auth.credentials.token
    user_params[:token_expiry] = Time.at(auth.credentials.expires_at)
    user_params = user_params.to_h

    # look for the user
    user = User.find_by(provider: auth.provider, uid: auth.uid)
    user ||= User.find_by(email: auth.info.email) # User did a regular sign up in the past.
    if user
      user.update(user_params)
    else
      user = User.new(user_params)
      user.password = Devise.friendly_token[0,20]  # Fake password for validation
      user.save
    end

    return user
  end
end
