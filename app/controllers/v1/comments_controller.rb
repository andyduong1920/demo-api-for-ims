class V1::CommentsController < V1::BaseController
  before_action :auth_user, only: [:create, :update, :destroy]
  before_action :load_comment, only: [:update, :show, :destroy]
  before_action :load_post, only: [:create], if: :params_post_id?

  def index
    @comments = Comment.all
    render json: message_success("Get list comment successfully", @comments)
  end

  def show
    render json: message_success("Get comment successfully", @comment)
  end

  def create
    @comment = @post.comments.new(comment_params)
    @comment.user = current_user
    @comment.save!
    render json: message_success("Create comment successfully", @comment)
  end

  def update
    @comment.update_attributes(comment_params)
    render json: message_success("Update comment successfully", @comment)
  end

  def destroy
    @comment.destroy
    render json: message_success("Destroy comment successfully", @comment)
  end

  private
  def load_comment
    @comment = Comment.find(params[:id])
  end

  def load_post
    @post = Post.find(params[:post_id])
  end

  def params_post_id?
    raise ActionController::ParameterMissing.new(["post_id"]) unless params[:post_id].present?
    params[:post_id].present?
  end

  def comment_params
    return permit_params(["content"])
  end
end
