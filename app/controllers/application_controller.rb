class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordInvalid, with: :handle_parameter_missing

  def handle_parameter_missing(exception)
    render json: { errors: [ { "code": 400, "message": exception.message }]}, status: :bad_request
  end
end
