module Compatibility::Profile

  def self.included(base)
    base.class_eval do
      scope :property_name_like, -> (q) { where('P_NAME LIKE ?', "%#{q}%") }
      scope :street_number_like, -> (q) { where('P_STREET_NUMBER LIKE ?', "%#{q}%") }
      scope :street_name_like, -> (q) { where('P_STREET_NAME LIKE ?', "%#{q}%") }
      scope :city_like, -> (q) { where('P_CITY LIKE ?', "%#{q}%") }
      scope :county_like, -> (q) { where('COUNTY LIKE ?', "%#{q}%") }
      scope :zipcode_like, -> (q) { where('P_ZIP LIKE ?', "%#{q}%") }
      scope :market_area_like, -> (q) { where('MARKET_AREA LIKE ?', "%#{q}%") }
      scope :district_like, -> (q) { where('DISTRICT LIKE ?', "%#{q}%") }
      scope :land_lot_like, -> (q) { where('LANDLOT LIKE ?', "%#{q}%") }
      scope :owner_name_like, -> (q) { where('OWNER LIKE ?', "%#{q}%") }

      scope :insider_date_before, -> (q) { where('insider_date <= ?', q) }
      scope :insider_date_after, -> (q) { where('insider_date >= ?', q) }

      scope :year_built_before, -> (q) { where('built_complete <= ?', q) }
      scope :year_built_after, -> (q) { where('built_complete >= ?', q) }

      scope :number_units_under, -> (q) { where('UNITS <= ?', q) }
      scope :number_units_over, -> (q) { where('UNITS >= ?', q) }
    end
  end

  def name
    self.P_NAME
  end

  def street_number
    self.P_STREET_NUMBER
  end

  def street_name
    self.P_STREET_NAME
  end

  def address
    "#{street_number} #{street_name}" if street_number && street_name
  end

  def city
    self.P_CITY
  end

  def zipcode
    self.P_ZIP
  end

  def county
    self.COUNTY
  end

  def year_built
    built_complete.year if built_complete
  end

  def description
    self.DESCRIPTION
  end

  def owner
    self.OWNER
  end

  def market_area
    self.MARKET_AREA
  end

  def district
    self.DISTRICT
  end

  def state
    self.P_STATE
  end

  def landlot
    self.LANDLOT
  end

  def parcel
    self.PARCEL
  end

  def cross_road
    self.P_CROSS_STREET_NAME
  end


end
