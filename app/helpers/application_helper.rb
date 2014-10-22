module ApplicationHelper
  def sidebar
    str = ''
    str += '<aside class="sidebar">'
    str += '<div id="logged_in">'
    if signed_in?
      str += "<p id=""user_info"">#{current_user}<br>#{link_to('Logout', signout_path, :method => :delete)}</p>"
    else
      str += "<p id=""user_info"">#{link_to('Login', signin_path)} | #{link_to('Register', signup_path)}</p>"
    end
    str += '</div>'
    str += '<div id="new_post">'
    str += "<p>#{link_to('New Entry', new_entry_path)}</p>"
    str += '</div>'
    str += '</aside>'
    raw(str)
  end
end
