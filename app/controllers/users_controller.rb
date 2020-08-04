class UsersController < ApplicationController
  def create
    user = User.new(user_params)
    if user.save
      token = JsonWebToken.encode({
        userId: user.id
      })
      render json: {token: token}.to_json
    else
      render json: user.errors, status: :bad_request
    end
  end

  def signin
    binding.pry
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
