class MapController < ApplicationController


  def mapsearch
    if(params[:distance])
      distance = params[:distance]
      puts "searching by distance"
      @postions = Item.where(is_valid: true, status: 0).search(params[:search]).paginate(page: params[:page])
    else
      params[:distance] = 1.0
    end

  end
end
