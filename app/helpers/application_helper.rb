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

  # Outputs a link to the list of resources keeping the Ransack filters (stored
  # in params or flash)
  #
  # ==== Attributes
  #
  # [+klass+]   Class of the resource, to infer the helper name
  def back_link(klass)
    method = "#{klass.to_s.tableize}_path"
    link_to t('back'), send(method, :q => params[:q] || flash[:q]), class: 'btn btn-default'
  end
end
