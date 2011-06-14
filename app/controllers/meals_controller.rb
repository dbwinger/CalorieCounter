class MealsController < ApplicationController
  # Nested resources
  load_resource :user
  load_and_authorize_resource :meal, :through => :user, :shallow => true

  def create
    @meal.user_id = current_user.id
    if @meal.save
      redirect_to user_meals_path(@meal.user), :notice => 'Meal was successfully created.'
    else
      render :action => "new"
    end
  end

  def update
    if @meal.update_attributes(params[:meal])
      redirect_to user_meals_path(@meal.user), :notice => 'Meal was successfully updated.'
    else
      render :action => "edit"
    end
  end

  def destroy
    @meal.destroy
    redirect_to :back
  end
end

