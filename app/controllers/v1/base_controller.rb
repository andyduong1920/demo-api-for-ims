class V1::BaseController < ApplicationController
  
  def message_success(message, content)
    ResponseTemplate.success(message, content)
  end

  def message_error(message, content)
    ResponseTemplate.error(message, content)
  end
end
