class Apartment < ApplicationRecord
  self.table_name = 'insider_databankapartments'

  include Compatibility::Comments
  include Compatibility::ContactInformation
  include Compatibility::FinancialHighlights
  include Compatibility::Profile
  include Compatibility::TransactionHighlights
  include Compatibility::Sorting

  scope :land_sale_date_before, -> (q) { where('LAND_SALE_DATE <= ?', q) }
  scope :land_sale_date_end, -> (q) { where('LAND_SALE_DATE >= ?', q) }

  scope :number_units_under, -> (q) { where('UNITS_COMPLETED <= ?', q) }
  scope :number_units_over, -> (q) { where('UNITS_COMPLETED >= ?', q) }

  def breakouts
    (0..4).collect do |i|
      Breakout.new.tap do |b|
        b.unit_type = "#{i} BR"
        b.average_price = self["#{i}_avg_"]
        b.minimum_square_footage = self["#{i}_MIN_SF"]
        b.maximum_square_footage = self["#{i}_MAX_SF"]
        b.unit_mix = self["#{i}_BED"]
        b.increase = self["#{i}_INCREASE"]
        b.minimum_rent = self["#{i}_MIN_"]
        b.maximum_rent = self["#{i}_MAX_"]
      end
    end
  end

  class Breakout
    attr_accessor :unit_type
    attr_accessor :average_price
    attr_accessor :minimum_square_footage
    attr_accessor :maximum_square_footage
    attr_accessor :unit_mix
    attr_accessor :increase
    attr_accessor :minimum_rent
    attr_accessor :maximum_rent
  end

end
