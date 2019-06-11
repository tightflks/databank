module ApplicationHelper

  def flash_messages
    if flash[:notice]
      content_tag(:p, flash[:notice], class: 'alert alert-success m-t')
    elsif flash[:alert]
      content_tag(:p, flash[:alert], class: 'alert alert-danger m-t')
    end
  end

  def icon_tag(icon, options = {})
    css = "fa fa-#{h(icon)}"
    css += ' fa-spin' if options.delete(:spin)
    css += " #{h(options[:class])}" if options[:class]

    content_tag(:i, '', options.merge(class: css))
  end

  def icon_and_title(title, icon, options = {})
    "#{icon_tag(icon, options)} #{h(title)}".strip.html_safe
  end

  def title_and_icon(title, icon, options = {})
    "#{h(title)} #{icon_tag(icon, options)}".strip.html_safe
  end

end
