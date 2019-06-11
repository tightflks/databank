class ApartmentPolicy < ApplicationPolicy

  def index?
    current_user.apartment?
  end

  def show?
    index?
  end

end
