class Ability
  include CanCan::Ability

  def initialize(user)
   
    @user.roles.each { |role| send(role.name_to_symbol) }

    if @user.roles.size == 0
      can :read, :all 
    end
  end

  def moderator
    can :manage, Discussion
    can :manage, Comment
  end

  def admin
    can :manage, :all
  end

end
