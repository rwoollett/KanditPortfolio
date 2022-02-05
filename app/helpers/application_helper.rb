module ApplicationHelper
  def login_helper style = ''
   if current_user.is_a?(GuestUser) 
    (link_to "Register", new_user_registration_path, class: style) +
    " ".html_safe +
    (link_to "Login", new_user_session_path, class: style)
   else 
     button_to 'Logout', destroy_user_session_path,
            class: style,
            method: :delete,
            "data-turbo" => false
        end 
  end

  def source_helper(layout_name)
    if session[:source]
      greeting = "Thanks for visiting me from #{session[:source]} and you on the #{layout_name} layout"
      content_tag(:p, greeting, class:"source-greeting")
    end
  end

  def copyright_generator
    KanditViewTool::Renderer.copyright "Rodney Woollett", "All rights reserved"
  end

  def nav_items
    [
      { url: root_path,  title: 'Home' },
      { url: about_path,  title: 'About Me' },
      { url: contact_path,  title: 'Contact' },
      { url: blogs_path,  title: 'Blog' },
      { url: portfolios_path,  title: 'Portfolio' }
    ]
  end

  def nav_helper style, tag_type, tag_style='col-auto'
    nav_links = ''
    nav_items.each do |item|
      nav_links << "<#{tag_type} class='#{tag_style}'><a href='#{item[:url]}' class='#{style} #{active? item[:url]}'>#{item[:title]}</a></#{tag_type}>"
    end
    nav_links.html_safe
  end

  def active? path 
    "active" if current_page? path
  end

  def alerts
    alert = (flash[:alert] || flash[:error] || flash[:notice])
    if alert
      alert_generator alert
    end
  end

  def alert_generator msg
    js add_gritter(msg, title: "Rodney Woollett Portfolio", sticky: false, time: 1000)
  end

  def include_jquery 
    #A JQuery CDN "https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"
    javascript_include_tag "/assets/jquery3.min.js"
  end

end
