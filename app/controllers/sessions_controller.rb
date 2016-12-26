class SessionsController < ApplicationController
  before_action :set_session, only: [:show]

  # POST /sessions
  # POST /sessions.json
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      unless user.activated?
        render_unauthorized('Account is not activated. Please check email for activation email.')
      end
      @session = user.sessions.build
      @session.save!
    else
      render_unauthorized('Invalid username/password')
    end
  end

  # GET /status
  def status
    authenticate_with_http_token do |token, options|
      user = Session.find_by(auth_token: token).user
      if user
        render user
      else
        render_unauthorized('Invalid Auth Token')
      end
    end
    render_unauthorized('Invalid/Missing Auth Token')
  end

  # DELETE /sessions
  # DELETE /sessions.json
  def destroy
    authenticate_with_http_token do |token, options|
      session = Session.find_by(auth_token: token)
      if session
        session.destroy
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_session
    @session = Session.find(params[:id])
  end
end
