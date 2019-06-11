class Office < ApplicationRecord
  self.table_name = 'insider_databankoffshop'

  include Compatibility::Comments
  include Compatibility::ContactInformation
  include Compatibility::FinancialHighlights
  include Compatibility::Profile
  include Compatibility::TransactionHighlights
  include Compatibility::Sorting

  scope :not_project_type, ->(type) { where.not(PROJECT_TYPE: type) }

end
