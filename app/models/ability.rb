class Ability
  include CanCan::Ability

  def initialize user
    user ||= User.new
    if user.is_admin?
      can :manage, User
    else
      can :read, User do |u|
        u == user
      end
    end
  end
end
