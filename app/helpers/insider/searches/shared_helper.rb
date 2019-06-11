module Insider::Searches::SharedHelper

  def search_results_table_header(search, property)
    title = t("insider.searches.shared.results.columns.#{property}")

    if search.sort_by == property
      sort_order = search.opposite_sort_order
      title = "#{h(title)} #{icon_tag("sort-alpha-#{search.sort_order}")}".html_safe
    end

    sort_path = url_for(search.params.merge(sort_by: property, sort_order: sort_order))
    content_tag(:th, link_to(title, sort_path))
  end

  def property_profile(record)
    render({
      partial: 'insider/searches/shared/property_profile',
      locals: {result: record}
    })
  end

  def comments(record)
    render({
      partial: 'insider/searches/shared/comments',
      locals: {result: record}
    })
  end

  def transaction_highlights(record)
    render({
      partial: 'insider/searches/shared/transaction_highlights',
      locals: {result: record}
    })
  end

  def financial_highlights(record)
    render({
      partial: 'insider/searches/shared/financial_highlights',
      locals: {result: record}
    })
  end

  def unit_breakout(record)
    render({
      partial: 'insider/searches/shared/unit_breakout',
      locals: {result: record}
    })
  end

  module ContactInformation
    module Tabbed
      def contact_information(record)
        render({
          partial: 'insider/searches/shared/contact_information/tabbed',
          locals: {result: record}
        })
      end
    end

    module Flat
      def contact_information(record)
        render({
          partial: 'insider/searches/shared/contact_information/flat',
          locals: {result: record}
        })
      end
    end
  end
end
