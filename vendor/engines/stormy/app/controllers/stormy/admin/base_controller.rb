class Stormy::Admin::BaseController < StormyController

  before_filter :authenticate_stormy_user!

  layout "stormy/application"


end 
