class Stormy::BaseController < ApplicationController

  def page_not_found
    raise ActionController::RoutingError.new('Not Found')
  end

end
