class Ability
  include CanCan::Ability

  def initialize(user)

    user ||= User.new # Guest

    if user.role == 'admin'
      can :manage, :all
    end

    if user.role == 'user'
      can :create, Post
      cannot [:expire, :destroy], Post
      can :update, Post do |p|
        p.try(:user) == user
      end
    end

    can :read, :all

    

  end
end
