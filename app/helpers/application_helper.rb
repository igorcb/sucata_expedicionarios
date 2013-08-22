module ApplicationHelper

  def logged_in?
    session[:login]
  end

  def do_logout
  	session[:login] = nil
  end

end
