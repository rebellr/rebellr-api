class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods
  before_action :format_json

  def format_json
    request.format = 'json'
  end

  def render_unauthorized(reason)
    self.headers['WWW-Authenticate'] = 'Token realm="Application"'
    render json: {error: reason}, status: :unauthorized
  end

end
