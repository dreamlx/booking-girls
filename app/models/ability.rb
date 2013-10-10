class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
       user ||= User.new # guest user (not logged in)
       can :read, ActiveAdmin::Page, :name => "Dashboard"
       
       if user.role == 'admin'
         can :manage, :all
       end

       if user.role == 'enterprise'
        can :manage, AdminUser, id: user.id
        can :read, User, company_id: user.company.id unless user.company.blank? 
        can :manage, Company, admin_user_id: user.id
        can :manage, Venue, company_id: user.company.id unless user.company.blank?
        can :manage, MenuItem
        #can :manage, MenuList
        can :manage, Category
        #can :manage, ServiceMenu, company_id: user.company.id unless user.company.blank?
        #can :manage, Technician  unless user.company.service_menus.blank?
        #can :manage, Task unless user.company.technicians.blank?
       end

    #
    # The first argument to `can` is the action you are giving the user 
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. 
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
