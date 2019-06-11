module Insider::Searches::ApartmentsHelper

  def contact_information(apartment)
    render({
      partial: 'insider/searches/shared/contact_information/flat',
      locals: {result: apartment}
    })
  end

end
