class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.reg_time = Time.new
    if @user.save
      redirect_to signin_url
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
  end

  private

    def user_params
      params.require(:user).permit(:username, :email, :password,
                                   :password_confirmation)
    end
end
