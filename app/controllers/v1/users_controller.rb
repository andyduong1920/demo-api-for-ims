class V1::UsersController < V1::BaseController
  def create
    user = User.create!(user_params)
    
    render json: message_success("Sign up successfully", {api_token: user.api_token})
  end

  private
  def user_params
    params.permit(:email, :password)
  end
end
