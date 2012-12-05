class Stormy::PagesController < Stormy::BaseController

  def index

  end

  def show
    permalink = params[:page]
    @page = Stormy::Post.where(permalink: permalink).first

    page_not_found unless @page
  end
end
