# TODO these should just be directly on the user table
class Users::Settings < ActiveRecord::Base
  self.table_name = 'insider_insideruser'

  belongs_to :user

  validates_length_of :company_name, maximum: 100
  validates_length_of :company_street, maximum: 100
  validates_length_of :company_city, maximum: 100
  validates_length_of :company_state, maximum: 2

  before_validation :avoid_null_constraints

  def franchise
    retail?
  end

  def franchise?
    retail?
  end

  def franchise=(b)
    self.retail = b
  end

  def office
    offshop?
  end

  def office?
    offshop?
  end

  def office=(b)
    self.offshop = b
  end

  private

  def avoid_null_constraints
    self.apartment ||= false
    self.retail ||= false
    self.land ||= false
    self.offshop ||= false
    self.industrial ||= false

    self.company_name ||= ''
    self.company_street ||= ''
    self.company_city ||= ''
    self.company_state ||= ''

    true
  end

end
