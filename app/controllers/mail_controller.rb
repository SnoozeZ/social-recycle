class MailController < ApplicationController
  def reg_success
    #@User = user
    UserMailer.welcome_email(User.first).deliver_now
  end

  def new_dibs

  end
end
