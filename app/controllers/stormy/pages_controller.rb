class Stormy::PagesController < ApplicationController

  def index

  end

  def show
    permalink = params[:page]
    @page = Stormy::Post.where(permalink: permalink).first
  end
end
