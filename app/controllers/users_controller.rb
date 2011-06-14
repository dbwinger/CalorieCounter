class UsersController < ApplicationController
  load_and_authorize_resource

  def create
    if @user.save
      flash[:notice] = "Registration successful."
      redirect_to root_url
    else
      render :action => 'new'
    end
  end

  def update
    # don't ever actually do this
    if params[:user][:give_me_superpowers]
      session[:superpowers] = true
    end
    if @user.update_attributes(params[:user])
      flash[:notice] = "Successfully updated profile."
      redirect_to root_url
    else
      render :action => 'edit'
    end
  end

  def superpowers
    authorize! :superpowers, current_user
    session[:superpowers] = true
    redirect_to :back, :notice => 'Superpowers granted. Reign responsibly.'
  end
end

