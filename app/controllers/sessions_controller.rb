class SessionsController < ApplicationController
  protect_from_forgery with: :exception

  def show
    user = current_user
    return render json: { error: "Not authenticated" }, status: :unauthorized unless user

    render json: user_response(user)
  end

  def create
    user = User.find_by(email_address: email_address)&.authenticate(params.require(:password))

    if user
      reset_session
      session[:user_id] = user.id
      render json: user_response(user)
    else
      render json: { error: "Invalid email or password" }, status: :unauthorized
    end
  end

  def destroy
    reset_session
    head :no_content
  end

  private

  def current_user
    User.find_by(id: session[:user_id])
  end

  def email_address
    params.require(:email_address).to_s.strip.downcase
  end

  def user_response(user)
    { id: user.id, email_address: user.email_address }
  end
end
