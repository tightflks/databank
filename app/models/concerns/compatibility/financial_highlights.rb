module Compatibility::FinancialHighlights

  def self.included(base)
    base.class_eval do
      scope :property_sale_date_before, -> (q) { where('sale_date <= ?', q) }
      scope :property_sale_date_after, -> (q) { where('sale_date >= ?', q) }

      scope :property_sale_price_under, -> (q) { where('SALE_PRICE <= ?', q) }
      scope :property_sale_price_over, -> (q) { where('SALE_PRICE >= ?', q) }

      scope :land_sale_date_before, -> (q) { where('land_sale_date <= ?', q) }
      scope :land_sale_date_end, -> (q) { where('land_sale_date >= ?', q) }

      scope :land_sale_price_under, -> (q) { where('LAND_SALE_PRICE <= ?', q) }
      scope :land_sale_price_over, -> (q) { where('LAND_SALE_PRICE >= ?', q) }
    end
  end

  def property_sale_amount
    self.SALE_PRICE
  end

  def property_sale_date
    sale_date
  end

  def land_sale_amount
    self.LAND_SALE_PRICE
  end

  def land_sale_date
    if has_attribute?(:LAND_SALE_DATE)
      self.LAND_SALE_DATE
    else
      self[:land_sale_date]
    end
  end

  def foreclosure_amount
    if has_attribute?(:FORECLOSURE_PRICE)
      self.FORECLOSURE_PRICE
    else
      self.FORECLOSED_PRICE
    end
  end

  def foreclosure_date
    if has_attribute?(:foreclosure_date)
      super
    else
      self.FORECLOSURE_DATE
    end
  end

  def equity
    if has_attribute?(:_EQUITY)
      self._EQUITY
    else
      self.EQUITY
    end
  end

  def down_payment
    if has_attribute?(:_DOWNPAYMENT)
      self._DOWNPAYMENT
    else
      self.DOWNPAYMENT
    end
  end

  def purchase_note
    if has_attribute?(:_PURCHASE_NOTE)
      self._PURCHASE_NOTE
    else
      self.PURCHASE_NOTE
    end
  end

  def utility
    if has_attribute?(:UTILITIES)
      self.UTILITIES
    else
      self[:utility]
    end
  end

  def application_fee
    if has_attribute?(:APPLICATION_FEE)
      self.APPLICATION_FEE
    else
      self[:application_fee]
    end
  end

  def refund_amount?
    has_attribute?(:REFUND)
  end

  def refund_amount
    self.REFUND
  end

  def units_vacant?
    has_attribute?(:UNITS_VACANT)
  end

  def units_vacant
    self.UNITS_VACANT
  end

  def pet_deposit_amount?
    has_attribute?(:PET_DEPOSIT)
  end

  def pet_deposit_amount
    self.PET_DEPOSIT
  end

  def monthly_income
    if has_attribute?(:MONTHLY_INCOME)
      self.MONTHLY_INCOME
    else
      self[:monthly_income]
    end
  end

  def yearly_income
    if has_attribute?(:YEARLY_INCOME)
      self.YEARLY_INCOME
    else
      self[:yearly_income]
    end
  end

end
