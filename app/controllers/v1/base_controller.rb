class V1::BaseController < ApplicationController
  
  def message_success(message, content)
    ResponseTemplate.success(message, content)
  end
end
