class MealsController < ApplicationController
  # Nested resources
#  if params[:user_id]
    load_and_authorize_resource :user
    load_and_authorize_resource :meal, :through => :user, :shallow => true
#  else
#    load_and_authorize_resource
#  end

  def create
    if @meal.save
      redirect_to(@meal, :notice => 'Meal was successfully created.')
    else
      render :action => "new"
    end
  end

  def update
    if @meal.update_attributes(params[:meal])
      redirect_to(@meal, :notice => 'Meal was successfully updated.')
    else
      render :action => "edit"
    end
  end

  def destroy
    @meal.destroy
    redirect_to :back
  end
end

