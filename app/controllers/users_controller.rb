class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.reg_time = Time.new
    if @user.save
      #notify the user by mail
      #UserMailer.welcome_email(@user).deliver_now
      UserMailer.verify_email(@user).deliver_now
      #UserMailer.account_activation(@user).deliver_now
      log_in @user
      flash[:success]="You need to activate your account in your email!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id]);
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def show
    @user = User.find(params[:id])
    @items = @user.items.paginate(page: params[:page])
    @dibs_items = @user.dibs_item.paginate(page: params[:page])
  end

  private

    def user_params
      params.require(:user).permit(:username, :email, :phone, :password,
                                   :password_confirmation)
    end
end
