class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :update_allowed_parameters, if: :devise_controller?

  include Pundit

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user|
      user.permit(:email,
                  :name,
                  :username,
                  :avatar,
                  :password,
                  :password_confirmation,
                  :role
                  )
    end
  end
end
