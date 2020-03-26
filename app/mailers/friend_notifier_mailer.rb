class FriendNotifierMailer < ApplicationMailer
  def inform(email_info, friend_email)
    @user = email_info[:user]
    @message = email_info[:message]
    @friend = email_info[:friend]
    mail(to: friend_email, subject: "#{@user} is sending you some advice")
  end
end
