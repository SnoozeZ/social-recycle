class ItemsController < ApplicationController
  #respond_to :js
  def new
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
  end

  def create
    @item = current_user.items.build(item_params)
    if @item.save
      flash[:success] = "Item posted!"
      redirect_to root_url
    else
      render 'new'
    end
  end

  def index
    #@items = Item.search(params[:search]).paginate(page: params[:page])
    @items = Item.all.paginate(page: params[:page])
  end

  private

    def item_params
      params.require(:item).permit(:title, :description, :timeout,
                                   :avatar, :category_id, :avatar_cache)
    end

    def current_user
      user = User.find(1)
    end

end
