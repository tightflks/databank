class IndustrialPolicy < ApplicationPolicy

  def index?
    current_user.industrial?
  end

  def show?
    index?
  end

end
