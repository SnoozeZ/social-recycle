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

  def index type
    if type == 0
      @items = Item.where(is_valid: true, status: 0).paginate(page: params[:page])
    else
      @items = Item.where(is_valid: true, status: 0, category_id: type).paginate(page: params[:page])
    end
  end

  def search
    @items = Item.where(is_valid: true, status: 0).search(params[:search]).paginate(page: params[:page])
  end


  private

    def item_params
      params.require(:item).permit(:title, :description, :timeout,
                                   :avatar, :category_id, :avatar_cache, :status)
    end

end
