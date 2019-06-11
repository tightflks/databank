class ApplicationPolicy

  attr_reader :current_user
  attr_reader :record

  def initialize(current_user, record)
    @current_user = current_user
    @record = record
  end

end
