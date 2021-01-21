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
    record == user && user.status == "smoker_setup" && !user.is_mentor?
  end

  def invite_a_friend?
    record == user && user.is_mentor?
  end

  def profile_update?
    record == user && user.status == "smoker_setup" && !user.is_mentor?
  end
end
