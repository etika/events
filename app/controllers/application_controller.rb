class ApplicationController < ActionController::Base
	  before_action :authenticate_user!

  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

  def after_sign_in_path_for(resource)
   events_path
  end
  def after_sign_out_path_for(resource)
   events_path
  end

  # rescue_from CanCan::AccessDenied do |_exception|
  #   redirect_to root_url, notice: "Access Denied"
  # end
end
