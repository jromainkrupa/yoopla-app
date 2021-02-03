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
    record.user == user && user.status == User::STATUS.third
  end

  def calendar?
    record.user == user
  end

  def dashboard?
    record.user == user && user.status == User::STATUS.third || User::STATUS.fourth
  end

  def get_ready?
    record.user == user && user.status == User::STATUS.third
  end
end
