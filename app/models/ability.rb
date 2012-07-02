class Ability
  include CanCan::Ability

  def initialize(user)
    if user.role == 'superadmin'
      can :manage, :all
    elsif user.role == 'admin'
      can :manage, [Box,Admin,Ticket,Result]
    elsif user.role == 'manager'
      can :manage, [Ticket,Result]
    elsif user.role == 'observer'
       can :read, [Box]
    end
  end
end