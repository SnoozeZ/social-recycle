class MapController < ApplicationController


  def mapsearch
    if(params[:distance] && params[:lat][:lat] && params[:lng][:lng])
      distance = params[:distance].to_f
      puts "searching by distance"
      puts params[:lat]
      puts params[:lng]
      lat = params[:lat][:lat].to_f
      lng = params[:lng][:lng].to_f
      ulat = lat + distance/85.0
      llat = lat - distance/85.0
      ulng = lng + distance/111.7
      llng = lng - distance/111.7
      puts ulat, llat, ulng, llng
      # @positions = Item.where("lat between ? and ?", -180, 180)
      @positions = Item.where("lat between ? and ? and lng between ? and ?", llat, ulat, llng, ulng)
    else
      params[:distance] = 1.0
      @positions = nil
    end

  end
end
