class V1::PostsController < V1::BaseController
  before_action :auth_user, only: [:create, :update, :destroy]
  before_action :load_post, only: [:update, :show, :destroy]

  def index
    @posts = Post.all
    render json: message_success("Get list post successfully", @posts)
  end

  def show
    render json: message_success("Get post successfully", @post)
  end

  def create
    @post = current_user.posts.create!(post_params)
    render json: message_success("Create post successfully", @post)
  end

  def update
    @post.update_attributes(post_params)
    render json: message_success("Update post successfully", @post)
  end

  def destroy
    @post.destroy
    render json: message_success("Destroy post successfully", @post)
  end

  private
  def load_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.permit(:title, :content)
  end
end
