class MailController < ApplicationController
  def reg_success
    #@User = user
    UserMailer.welcome_email(User.first).deliver_now
  end

  def test_daily_notify
    UserMailer.daily_notify(User.first).deliver_now
  end

  def test_get_item_notify

  end

end
