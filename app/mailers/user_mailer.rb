class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def welcome_email(user)
    @user = user
    mail(from: 'social.recycle.cse210@gmail.com', to: @user.email, subject: 'Welcome to Social Recycle')
  end

  def daily_notify(user)
    @user = user
    mail(from: 'social.recycle.cse210@gmail.com', to: @user.email, subject: 'Some One Dibsed Your item Today!')
  end
end
