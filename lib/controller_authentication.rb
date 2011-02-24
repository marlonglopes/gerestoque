# This module is included in your application controller which makes
# several methods available to all controllers and views. Here's a
# common example you might add to your application layout file.
#
#   <% if logged_in? %>
#     Welcome <%= current_user.username %>.
#     <%= link_to "Edit profile", edit_current_user_path %> or
#     <%= link_to "Log out", logout_path %>
#   <% else %>
#     <%= link_to "Sign up", signup_path %> or
#     <%= link_to "log in", login_path %>.
#   <% end %>
#
# You can also restrict unregistered users from accessing a controller using
# a before filter. For example.
#
#   before_filter :login_required, :except => [:index, :show]
module ControllerAuthentication
  def self.included(controller)
    controller.send :helper_method, :current_user, :logged_in?, :redirect_to_target_or_default, :remote_addr
  end

	def check_admin
	  	if logged_in? 
			redirect_to root_path unless current_user.admin?		
		end
	end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user
  end

  def login_required
    unless logged_in?
      flash[:error] = "You must first log in or sign up before accessing this page."
      store_target_location
      redirect_to login_url
    end
  end

  def redirect_to_target_or_default(default)
    redirect_to(session[:return_to] || default)
    session[:return_to] = nil
  end


	def remote_addr
		if request.env['REMOTE_ADDR'].split('.')[0] == "130" or request.env['REMOTE_ADDR'].split('.')[0] == "131" or request.env['REMOTE_ADDR'].split('.')[0] == "192" or request.env['REMOTE_ADDR'].split('.')[0] == "127"
			return true
		else
			return false
		end
	end


  private

  def store_target_location
    session[:return_to] = request.url
  end
end
