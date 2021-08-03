module ApplicationHelper

  def nav_item(url_name, url = 'javascript:;')
    content_tag :li, class: 'nav-item' do
      link_to url_name, url, class: 'nav-link'
    end
  end

end
