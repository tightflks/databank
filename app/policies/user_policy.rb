class UserPolicy < ApplicationPolicy

  def index?
    is_superuser?
  end

  def show?
    is_superuser?
  end

  def new?
    is_superuser?
  end

  def create?
    is_superuser?
  end

  def edit?
    is_superuser?
  end

  def update?
    is_superuser?
  end

  def destroy?
    is_superuser? && record != current_user
  end

  private

  def is_superuser?
    current_user.is_superuser?
  end

end
