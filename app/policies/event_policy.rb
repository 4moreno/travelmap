class EventPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def create?
    true
  end

  def show?
    true
  end

  def update?
    # record = instance of event
    # user = current_user
    record.user == user
  end

  def destroy?
    record.user == user
  end
end
