class StormyController < Stormy.parent_controller.constantize

  def authenticate_stormy_user!
    raise "Not Authenticated" if !stormy_user    
  end

  def stormy_user
    current_admin
  end

  def page_not_found
    raise ActionController::RoutingError.new('Not Found')
  end

end
