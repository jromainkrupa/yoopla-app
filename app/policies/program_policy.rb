class ProgramPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    create?
  end

  def create?
    record.user = user
  end

  def tutorial?
    record.user = user
  end

  def show?
    record.user = user
  end

end
