class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordInvalid, with: :handle_parameter_missing
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  rescue_from ActionController::RoutingError, with: -> { render_404 }

  def handle_parameter_missing(exception)
    render json: { errors: [ { "code": 400, "message": exception.record.errors }]}, status: :bad_request
  end

  def render_not_found_response(exception)
    render json: { errors: [ { "code": 404, "message": exception.message }]}, status: :not_found
  end
end
