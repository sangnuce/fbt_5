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
    else
      can :read, User do |u|
        u == user
      end
      can [:read, :create], Comment
      can [:read, :create], Review
      can :manage, Like
      can [:new, :create], Booking
    end
  end
end
