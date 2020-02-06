class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by(email: params[:email])
    if authenticated?(user)
      session[:user_id] = user.id
      flash[:success] = "Welcome, #{user.first_name}!"
      redirect_to advice_path
    else
      flash[:error] = "Sorry, your credentials are bad."
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

  private
    def authenticated?(user)
      user && user.authenticate(params[:password])
    end
end
