class ChartPolicy < ApplicationPolicy
  class Scope < ApplicationPolicy::Scope
    def resolve
      scope.readable_by(user)
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
