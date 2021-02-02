class Smoke < ApplicationRecord
  belongs_to :user

  # use @user.smokes.today to retrieve today smoke of a user
  scope :today, -> { where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day) }

end
