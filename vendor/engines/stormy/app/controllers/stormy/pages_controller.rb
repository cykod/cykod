class Stormy::PagesController < StormyController
  layout "application"

  def index
    @posts = Stormy::Post.posts.recent.all
  end

  def show
    permalink = params[:page]
    @page = Stormy::Post.where(permalink: permalink).first

    page_not_found unless @page
  end

end
