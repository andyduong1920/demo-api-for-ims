class V1::ErrorsController < V1::BaseController
  def catch_404
    render json: message_error(
      "Router not invalid", 
        {
          path: request.path, 
          method: request.method
        }
    ) and return
  end
end
