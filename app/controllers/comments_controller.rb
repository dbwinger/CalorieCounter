class CommentsController < ApplicationController
  load_resource :user
  load_resource :meal
  load_and_authorize_resource :comment, :through => [:user, :meal]

  def create
    @comment.user_id = current_user.id;
    if @comment.save
      if @user
        redirect_to user_meals_path @user
      else
        redirect_to meal_path @meal
      end
    else
      render :new
    end
  end
end

