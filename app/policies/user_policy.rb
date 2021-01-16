class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def set_status_form?
    record == user
  end

  def set_status?
    record == user
  end

  def smoker_profile_definition?
    record == user && user.user_status == "smoker_setup"
  end

  def invite_a_friend?
    record == user && user.user_status == "mentor"
  end

  def profile_update?
    record == user && user.user_status == "smoker_setup"
  end

  def smoker_profile_definition_step_2?
    record == user && user.user_status == "smoker_setup"
  end
end
