class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def welcome_email(user)
    @user = user
    mail(from: 'social.recycle.cse210@gmail.com', to: @user.email, subject: 'Welcome to Social Recycle')
  end

  def daily_notify(user)
    @user = user
    @item = Item.find_by_sql("SELECT dibs.user_id, dibs.item_id FROM dibs JOIN items ON dibs.item_id = items.id WHERE items.user_id = 1")

    if @item
      mail(from: 'social.recycle.cse210@gmail.com', to: @user.email, subject: 'Some One Dibsed Your item Today!')
    end
  end
end
