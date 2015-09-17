class V1::SessionsController < V1::BaseController
  before_action :auth_user, only: :destroy

  def create
    user = User.find_by!(email: session_params[:email])

    render json: message_error(
      "Password invalid", 
      "Password invalid"
    ) and return unless user.valid_password?(session_params[:password])

    sign_in(user)
    user.send(:generate_token)

    render json: message_success("Sign in successfully", {api_token: user.api_token})
  end

  def destroy
    sign_out(current_user)
    render json: message_success(
      "Sign out successfully",
      "Sign out successfully"
    )
  end

  private
  def session_params
    params.permit(:email, :password)
  end
end
