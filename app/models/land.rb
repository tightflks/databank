class Land < ApplicationRecord
  self.table_name = 'insider_databankland'

  include Compatibility::Comments
  include Compatibility::ContactInformation
  include Compatibility::FinancialHighlights
  include Compatibility::Profile
  include Compatibility::TransactionHighlights
  include Compatibility::Sorting

end
