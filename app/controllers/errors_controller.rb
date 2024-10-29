class ErrorsController < ApplicationController
  def not_found
    render status: 404
  end

  def teapot
    render status: 418
  end

  def unprocessable_content
    render status: 422
  end

  def internal_server
    render status: 500
  end
end
