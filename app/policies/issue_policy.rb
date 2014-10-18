class IssuePolicy < ApplicationPolicy
  class Scope < ApplicationPolicy::Scope
    def resolvee
      user.issues
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
