class Ability
  include CanCan::Ability

  def initialize(user)
    if user.admin?
      can :manage, :all
    else
      can :update, user # can edit their own profile
      can :read, :all
    end
  end
end
