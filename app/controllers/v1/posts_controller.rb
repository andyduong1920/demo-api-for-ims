class V1::PostsController < V1::BaseController
  before_action :load_post, only: [:update, :show, :destroy]

  def index
    @posts = Post.all
    render json: template_respone(200, "Get list post successfully", @posts)
  end

  def show
    render json: template_respone(200, "Get post successfully", @post)
  end

  def create
    @post = Post.create!(post_params)
    render template_respone(200, "Create post successfully", @post)
  end

  def update
    @post.update_attributes(post_params)
    render template_respone(200, "Update post successfully", @post)
  end

  def destroy
    @post.destroy
    render template_respone(200, "Destroy post successfully", @post)
  end

  private
  def load_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.permit(:title, :content)
  end

  def template_respone(code, message,result)
    {
      code: code,
      message: message,
      result: result
    }
  end
end
