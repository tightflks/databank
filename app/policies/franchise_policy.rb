class FranchisePolicy < ApplicationPolicy

  def index?
    current_user.franchise?
  end

  def show?
    index?
  end

end
