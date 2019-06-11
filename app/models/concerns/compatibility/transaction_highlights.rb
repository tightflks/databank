module Compatibility::TransactionHighlights

  def self.included(base)
    base.class_eval do
      scope :number_acres_under, -> (q) { where('"#_ACRES" <= ?', q) }
      scope :number_acres_over, -> (q) { where('"#_ACRES" >= ?', q) }

      scope :square_ft_under, -> (q) { where('`#_SQ_FT_BUILT` <= ?', q) }
      scope :square_ft_over, -> (q) { where('`#_SQ_FT_BUILT` >= ?', q) }
    end
  end

  def insider_description
    self.INSIDER_DESCRIPTION
  end

  def units_count?
    has_attribute?(:UNITS_COMPLETED)
  end

  def units_count
    self.UNITS_COMPLETED
  end

  def onsite_telephone?
    has_attribute?(:ONSITE_PHONE)
  end

  def onsite_telephone
    self.ONSITE_PHONE
  end

  def acres_count
    self['#_ACRES']
  end

  def square_footage
    self['#_SQ_FT_BUILT']
  end

  def attorney_name
    self.ATTORNEY
  end

  def attorney_telephone
    self.ATTORNEY_PHONE
  end

end
