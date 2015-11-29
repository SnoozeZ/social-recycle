class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def welcome_email(user)
    @user = user
    mail(from: 'social.recycle.cse210@gmail.com', to: @user.email, subject: 'Welcome to Social Recycle')
  end
end
