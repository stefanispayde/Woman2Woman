class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?


  protected


  def configure_permitted_parameters
    added_attrs = [:email, :password, :password_confirmation, :remember_me, :avatar, :avatar_cache]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
  end

  def current_ability
  @current_ability ||= Ability.new(current_admin)
end

end
