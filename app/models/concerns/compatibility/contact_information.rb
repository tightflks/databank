module Compatibility::ContactInformation

  def self.included(base)
    base.class_eval do
      if column_names.include?('SELLER_FORECLOSEE')
        scope :seller_like, -> (q) { where('SELLER_FORECLOSEE LIKE ?', "%#{q}%") }
      elsif column_names.include?('SELLER')
        scope :seller_like, -> (q) { where('SELLER LIKE ?', "%#{q}%") }
      end
    end
  end

  def contacts
    {
      'owner' => contact_for('OWNER', 'O'),
      'broker' => contact_for('BROKER', 'B'),
      'construction' => contact_for('C_LENDER', 'C_L'),
      'leasing' => contact_for('TODO', 'LEASING'),
      'seller' => contact_for('SELLER_FORECLOSEE', 'S'),
      'lender' => contact_for('LENDER', 'L'),
    }
  end

  private

  def contact_for(attribute, prefix)
    Contact.new.tap do |c|
      c.name =            self[attribute]
      c.telephone =       self["#{prefix}_PHONE"]
      c.representative1 = self["#{prefix}_REP"]
      c.representative2 = self["#{prefix}_REP2"]
      # c.email =           self["#{prefix}_adsf"] # TODO
      # c.website =         self["#{prefix}_adsf"] # TODO
      c.address =         self["#{prefix}_STREET_NAME"]
      c.suite =           self["#{prefix}_SUITE_NUMBER"]
      c.po_box =          self["#{prefix}_P_O_BOX_NUMBER"]
      c.city =            self["#{prefix}_CITY"]
      c.state =           self["#{prefix}_STATE"]
      c.zip_code =        self["#{prefix}_ZIP"]
    end
  end

  class Contact
    attr_accessor :name
    attr_accessor :telephone
    attr_accessor :representative1
    attr_accessor :representative2
    attr_accessor :email
    attr_accessor :website
    attr_accessor :address
    attr_accessor :suite
    attr_accessor :po_box
    attr_accessor :city
    attr_accessor :state
    attr_accessor :zip_code
  end

end
