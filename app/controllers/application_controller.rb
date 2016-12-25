class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods

  def render_unauthorized(reason)
    self.headers['WWW-Authenticate'] = 'Token realm="Application"'
    render json: {error: reason}, status: :unauthorized
  end

end
