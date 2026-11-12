class UsersController < ApplicationController
  protect_from_forgery with: :exception

  def create
    user = User.new(user_params)

    if user.save
      session[:user_id] = user.id
      render json: user_response(user), status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.expect(user: [ :email_address, :password, :password_confirmation ])
  end

  def user_response(user)
    { id: user.id, email_address: user.email_address }
  end
end
