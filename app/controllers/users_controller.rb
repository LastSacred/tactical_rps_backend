class UsersController < ApplicationController

  def create
    paramh = user_params.to_h
    @newUser = User.new(username: paramh["username"], password_digest: paramh["password"])
    @newUser.save
  end

  def record
    331
  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end
end
