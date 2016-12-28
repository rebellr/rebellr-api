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

  def user_security
    authenticate_with_http_token do |token, options|
      user = Session.find_by(auth_token: token)
      if user.nil?
        render_unauthorized('Must be logged in to access this resource.')
      end
    end
  end
end
