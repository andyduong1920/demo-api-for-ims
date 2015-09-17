class V1::BaseController < ApplicationController
  
  def auth_user
    # not login
    render json: message_success(
      "Please sign in", 
      "Please sign in" 
    ) and return unless current_user

    
  end

  def message_success(message, content)
    ResponseTemplate.success(message, content)
  end

  def message_error(message, content)
    ResponseTemplate.error(message, content)
  end
end
