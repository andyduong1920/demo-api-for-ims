module ResponseTemplate
  def self.template(code, message, content)
    Rails.logger.error("Responding error (data='#{message}').")
    {
      status: code, 
      message: message, 
      result: content
    }
  end

  
  def self.success(message, content)
    template(200, message, content)
  end
end
