class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  protected

	  def after_sign_in_path_for(user)
	     if current_user.sign_in_count == 1
	        new_profile_path
	     else
	        root_path
	     end
	  end
end