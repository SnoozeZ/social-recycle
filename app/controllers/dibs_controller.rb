class DibsController < ApplicationController
  #respond_to :js


  def create
    @dib = Dib.new(dib_params)
    if @dib.save
      flash[:success] = "Success!"
      redirect_to root_url
    else
      flash[:alert] = "Failed!"
    end
  end

  def index
    @items = Item.search(params[:search]).paginate(page: params[:page])
    #@items = Item.all
  end

  private

    def dib_params
      params.require(:dib).permit(:item_id, :user_id)
    end



end
