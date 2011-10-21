module ApplicationHelper

  # Assigned to <body> for scoping.
  def body_id
    [request.path_parameters[:controller], request.path_parameters[:action]].map(&:parameterize).join('--')
  end

  def jobszy
    o = "<span class='j'>J</span>obs<span class='z'>z</span><span class='y'>y</span>".html_safe
    content_tag(:div, o, class: 'logo').html_safe
  end
end
