class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


# define paths for Devise after sign-in and sign-out
  def after_sign_in_path_for(resource)
  	edit_user_path(current_user)
  end

  def after_sign_out_path_for(resource_or_scope)
  	new_user_registration_path(current_user)
  end

end
