class V1::BaseController < ApplicationController
  
  def auth_user
    # not login
    render json: message_error(
      "Please sign in", 
      "Please sign in" 
    ) and return unless current_user

    # not have api token on header
    render json: message_error(
      "Please send api token on header", 
      "Please send api token on header" 
    ) and return unless api_token?

    # Token client not match with session on server
    render json: message_error(
      "api token invalid", 
      "api token invalid" 
    ) and return unless same_token?

    # Token expired
    render json: message_error(
      "api token expired", 
      "api token expired"
    ) and return if token_expire?
  end

  def message_success(message, content)
    ResponseTemplate.success(message, content)
  end

  def message_error(message, content)
    ResponseTemplate.error(message, content)
  end

  private
  # Check has api-token on header
  def api_token?
    request.headers["Api-Token"].present?
  end

  # Get api token from client request
  def api_token
    request.headers["Api-Token"]
  end

  # Check token in session map with token send from client
  def same_token?
    current_user.api_token == api_token
  end

  # Check token time expired
  def token_expire?
    current_user.expire_at < Time.current.to_i
  end
end
