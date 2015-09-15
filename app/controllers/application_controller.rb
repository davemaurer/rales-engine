class ApplicationController < ActionController::Base
  respond_to :json
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  def parameters
    request.query_parameters
  end

  def param_key
    parameters.keys.first
  end

  def param_value
    parameters[param_key]
  end
end
