module Compatibility::Sorting

  def self.included(base)
    base.class_eval do
      scope :by_property_name, -> (dir) { order('P_NAME' => dir) }
      scope :by_address, -> (dir) { order('P_STREET_NUMBER' => dir, 'P_STREET_NAME' => dir) }
      scope :by_city, -> (dir) { order('P_CITY' => dir) }
      scope :by_zipcode, -> (dir) { order('P_ZIP' => dir) }
      scope :by_county, -> (dir) { order('COUNTY' => dir) }
      scope :by_insider_date, -> (dir) { order('insider_date' => dir) }
      scope :by_sale_date, -> (dir) { order('sale_date' => dir) }
      scope :by_year_built, -> (dir) { order('built_complete' => dir) }
      scope :by_description, -> (dir) { order('DESCRIPTION' => dir) }
      scope :by_owner, -> (dir) { order('OWNER' => dir) }
    end
  end

end
