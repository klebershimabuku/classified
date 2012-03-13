class Ability
  include CanCan::Ability

  def initialize(user)

    user ||= User.new # Guest

    if user.role == 'admin'
      can :manage, :all
    end

    if user.role == 'user'
      can :create, Post
      can :new_post_successful, Post
      cannot [:expire, :destroy], Post
      can :update, Post do |p|
        p.try(:user) == user
      end
    end

    can :read, :all
    can :search, Post
    can :advanced_search, Post

    

  end
end
