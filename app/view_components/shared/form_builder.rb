class Shared::FormBuilder < ActionView::Helpers::FormBuilder

  def text_field_group(attribute, options = {})
    field_options = options[:field] || {}
    field = text_field(attribute, field_options.reverse_merge(class: 'form-control'))

    form_group(attribute, field, options)
  end

  def password_group(attribute, options = {})
    field_options = options[:field] || {}
    field = password_field(attribute, field_options.reverse_merge(class: 'form-control'))

    form_group(attribute, field, options)
  end

  def date_field_group(attribute, options = {})
    field_options = options[:field] || {}
    field = date_field(attribute, field_options.reverse_merge(class: 'form-control date-picker'))

    form_group(attribute, field, options)
  end

  def check_box_group(attribute, options = {})
    field = check_box(attribute, options[:field_options] || {})
    text = options[:text]
    label = @template.content_tag(:label, field << ' '.html_safe << text)
    field_col = @template.content_tag(:div, label, class: 'col-sm-offset-2 col-sm-10')

    @template.content_tag(:div, field_col, class: 'form-group')
  end

  private

  def form_group(attribute, input, options)
    label_col = label(attribute, class: 'control-label col-sm-2')
    field_col = @template.content_tag(:div, input, class: 'col-sm-6')

    hint = options[:hint]
    if hint
      hint_col = @template.content_tag(:div, hint, class: 'col-sm-4')
    else
      hint_col = ''.html_safe
    end

    @template.content_tag(:div, class: 'form-group') do
      label_col << field_col << hint_col
    end
  end

end
