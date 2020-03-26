class AdviceController < ApplicationController

  def show
    redirect_to root_path unless logged_in?
  end

  def create
    @advice = AdviceGenerator.new
    friend_email = params[:friends_email]
    email_info = {user: current_user,
                  friend: params[:friends_name],
                  message: @advice.message
                 }
    FriendNotifierMailer.inform(email_info, friend_email).deliver_now
    flash[:notice] = "Thank you for sending a bit of advice."
    redirect_to advice_url
  end
end
