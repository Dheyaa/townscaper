class RegistrationsController < Devise::RegistrationsController
  private
  def after_inactive_sign_up_path_for(resource)
  	flash[:alert] = 'You will receive an email with instructions about how to confirm your account in a few minutes. Please check your email.'
    new_user_session_path
  end
end