#
# Application-wide helpers
#
module ApplicationHelper

  # Outputs a <li> element suitable for use in Bootstrap nav menus, that is,
  # with the 'active' css class when needed
  #
  # ==== Attributes
  #
  # [+label+]   Text to display
  # [+path+]    Target URL
  # [+options+] The only supported option right now is +:controller+ to specify
  #             the name of a controller whose actions will be considered to be the
  #             current page
  def nav_tab(label, path, options = {})
    if c = options[:controller]
      css = controller_name == c.to_s ? 'active' : nil
    else
      css = current_page?(path) ? 'active' : nil
    end
    content_tag(:li, link_to(t(label), path), :class => css)
  end
end
