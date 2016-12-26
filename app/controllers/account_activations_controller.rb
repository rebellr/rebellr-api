class AccountActivationsController < ApplicationController
  def activate
    user = User.find_by(email: params[:email])
    if user && !user.activated? && user.authenticated?(:activation, params[:activation_token])
      user.update_attribute(:activated, true)
      user.update_attribute(:activated_at, Time.zone.now)
      head :ok
    elsif user.nil? || !user.authenticated?(:activation, params[:activation_token])
      render_unauthorized('Invalid activation token.')
    elsif
      render_unauthorized('User already activated.')
    end
  end
end
