class Insider::Search::FormBuilder < Shared::FormBuilder

  # user name="attribute" instead of name="search[attribute]"
  # for backwards URL compatibility

  def text_field_group(attribute, options = {})
    field_options = options[:field] || {}
    field = text_field(attribute, field_options.reverse_merge(name: attribute, class: 'form-control'))

    form_group(attribute, field, options)
  end

  def date_field_group(attribute, options = {})
    field_options = options[:field] || {}
    field = text_field(attribute, field_options.reverse_merge(name: attribute, class: 'form-control date-picker'))

    form_group(attribute, field, options)
  end

end
