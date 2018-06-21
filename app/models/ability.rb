class Ability
  include CanCan::Ability

  def initialize(admin)
    can :read, :all
  end
end
