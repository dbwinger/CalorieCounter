class Ability
  include CanCan::Ability

  def initialize(user, superpowers)
    if user
      # Admins can do whatever the heck they want!
      if user.role == 'admin' || superpowers
        can :manage, :all
        can :change_roles, User
      else
        can :update, User, :id => user.id
        can :manage, Meal, :user_id => user.id
        can [:read, :create], Comment
        # Only get to destroy if they're comments on you or your meals
        can :destroy, Comment do |comment|
          comment.commentable == user ||
          comment.commentable_type == 'Meal' and user.meals.where(:id => comment.commentable_id).any?
        end
        can :superpowers, User, :username => 'daryl'
      end
    else # Guests
      can :create, User
    end

    # Anyone can see public meals & comments
    can :read, User
    can :read, Meal, :public => true
    can :read, Comment, :meal => {:public => true}
  end
end

