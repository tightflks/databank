class LandPolicy < ApplicationPolicy

  def index?
    current_user.land?
  end

  def show?
    index?
  end

end
