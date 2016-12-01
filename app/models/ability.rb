class Ability
  include CanCan::Ability

  def initialize user
    user ||= User.new
    if user.is_admin?
      can :manage, User
      can [:read, :create], Comment
      can [:read], Review
      can [:read, :update], Booking
      can :manage, Place
      can :manage, Tour
      can :manage, Category
      can [:read, :destroy], Review
    else
      can :read, User do |u|
        u == user
      end
      can [:read, :create], Comment
      can [:read, :create], Review
      can [:update, :destroy], Review do |review|
        review.user == user
      end
      can :manage, Like
      can [:new, :create], Booking
      can [:read, :update], Booking do |booking|
        booking.user == user
      end
    end
    can [:read, :update], Notification do |notification|
      notification.notified == user
    end
  end
end
