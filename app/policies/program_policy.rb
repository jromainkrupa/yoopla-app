class ProgramPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    true
  end

  def create?
    record.user == user
  end

  def tutorial?
    record.user == user
  end

  def show?
    record.user == user
  end

  def dashboard?
    record.user == user
    # && user.status == "in_program"
  end

  def get_ready?
    record.user == user && user.status == "ready_to_start"
  end
end
