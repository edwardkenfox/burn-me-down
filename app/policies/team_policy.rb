class TeamPolicy < ApplicationPolicy
  class Scope < ApplicationPolicy::Scope
    def resolve
      user.teams
    end
  end

  def index?
    true
  end

  def update?
    show?
  end

  def create?
    true
  end

  def destroy?
    show?
  end
end
