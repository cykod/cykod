class ApplicationController < ActionController::Base
  protect_from_forgery

  def current_admin
    Admin.new
  end
end
