class UserSessionsController < ApplicationController
  load_resource

  def create
    if @user_session.save
      flash[:notice] = "Successfully logged in."
      redirect_to root_url
    else
      render :action => 'new'
    end
  end

  def destroy
    @user_session = UserSession.find
    @user_session.destroy
    session[:superpowers] = false
    flash[:notice] = "Successfully logged out."
    redirect_to root_url
  end
end

