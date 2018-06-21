class Ability
  include CanCan::Ability

  def initialize(admin)
    can :read, :all    #first argument is action you want to perform on model
  end                     #second is model type you want to perforn action on
end
