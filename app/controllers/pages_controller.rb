class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :privacy_policy, :terms_and_conditions]

end
