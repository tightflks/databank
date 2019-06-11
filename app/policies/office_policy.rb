class OfficePolicy < ApplicationPolicy

  def index?
    current_user.office?
  end

  def show?
    index?
  end

end
