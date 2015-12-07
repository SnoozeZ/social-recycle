class ItemsController < ApplicationController
  #respond_to :js
  def new
    if !current_user
      redirect_to signin_url
    end
    @item = Item.new
    @item.post_date = Date.today();
  end

  def show
    @item = Item.find(params[:id])
  end

  def create
    @item = current_user.items.build(item_params)
    if @item.save
      flash[:success] = "Item posted!"
      redirect_to items_url(type: {category: 0})
    else
      render 'new'
    end
  end

  def index
    if !cat_params[:category] || cat_params[:category] == "0"
      @items = Item.where(is_valid: true, status: 0).paginate(page: params[:page])
    else
      @items = Item.where(is_valid: true, status: 0, category_id: cat_params[:category].to_i).paginate(page: params[:page])
    end
  end

  def search
    @items = Item.where(is_valid: true, status: 0).search(params[:search]).paginate(page: params[:page])
  end


  private

    def item_params
      params.require(:item).permit(:title, :description, :expire_time,
                                   :avatar, :category_id, :avatar_cache, :status, :lng, :lat, :address)
    end
    def cat_params
      params.require(:type).permit(:category)
    end

end
