class RegistrationController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to advice_path
    else
      redirect_to registration_path, alert: "Something went wrong, please try again."
    end
  end

  private
    def user_params
      params.permit(:first_name, :last_name, :email, :password)
    end
end
