class ApplicationController < ActionController::Base
  protect_from_forgery
  include ::CloudFactory

  helper_method :current_user, :current_user_session

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  def current_user_session
    if defined?(@current_user_session)
      return @current_user_session
    end
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
  end
end

