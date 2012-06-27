class Ability
  include CanCan::Ability

  def initialize(user)
    if user.role == 'superadmin'
      can :manage, :all
    elsif user.role == 'admin'
      can :manage, [Box,State,Admin,Ticket]
    elsif user.role == 'manager'
      can :manage, Box
    elsif user.role == 'observer'
       can :read, [Box]
    end
  end
end