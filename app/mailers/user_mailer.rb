class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def welcome_email(user)
    @user = user
    mail(from: 'social.recycle.cse210@gmail.com', to: @user.email, subject: 'Welcome to Social Recycle')
  end

  def daily_notify(user)
    @user = user
    @item = Item.find_by_sql(['SELECT dibs.user_id, dibs.item_id FROM dibs JOIN items ON dibs.item_id = items.id WHERE items.user_id = ?', @user.id])
    if !@item.empty?
      mail(from: 'social.recycle.cse210@gmail.com', to: @user.email, subject: 'Some One Dibsed Your item Today!')
    end
  end

  def get_item_notify(giver, receiver, item)
    @giver = giver
    @receiver = receiver
    @item = item
    mail(from: 'social.recycle.cse210@gmail.com', to: @reveiver.email, subject: 'Congratulation! You got new item!')
  end
end
