class Stormy::Admin::FilesController < Stormy::Admin::BaseController

  def index
    @files = Stormy::File.recent.limit(20)
  end

  def new
    @file = Stormy::File.new
  end

  def edit
    @file = Stormy::File.find(params[:id]).first
  end

  def create
    @file = Stormy::File.new(file_params)

    if @file.save
      redirect_to action: "index"
    end
  end

  def update
    @file = Stormy::File.find(params[:id])

    if @file.update_attributes(file_params)
      redirect_to action: "index"
    end
  end

  protected

  def file_params
    params.require(:file)
          .permit(:document)
  end
  
end
