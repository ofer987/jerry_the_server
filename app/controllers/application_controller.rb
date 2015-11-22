class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_logged_user

  protected

  def set_logged_user
    @logged_user = begin
                     User.find(session[:user_id])
                   rescue
                     # Tell the logger about this
                     nil
                   end
  end
end
