
class Stormy::Admin::PostsController < Stormy::Admin::BaseController

  def index
    @posts = Stormy::Post.recent.limit(20)
  end

  def new
    @post = Stormy::Post.new
  end

  def edit
    @post = Stormy::Post.where(permalink: params[:id]).first
  end

  def create
    @post = Stormy::Post.new(post_params)
    
    @post.publish if params[:publish]
    @post.unpublish if params[:unpublish]

    handle_post_publication

    if @post.save
      return redirect_to( { action: 'index' }, 
                         notice: t("stormy.admin.posts.created"))
    end
    render :action => 'new'
  end

  def update
    @post = Stormy::Post.where(permalink: params[:id]).first
    @post.attributes = post_params

    handle_post_publication

    if @post.save
      return redirect_to( { action: 'index' }, 
                         notice: t("stormy.admin.posts.saved"))
    end
    render :action => 'edit'
  end

  protected

  def post_params
    params.require(:post)
          .permit(:name,:permalink,:body,:photo,:published_at_date,:published_at_time)
  end

  def handle_post_publication
    @post.publish if params[:publish]
    @post.unpublish if params[:unpublish]
  end

end
