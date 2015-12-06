class MapController < ApplicationController


  def mapsearch
    if(params[:distance])
      distance = params[:distance]
      puts "searching by distance"
      puts params[:lat]
      puts params[:lng]
      lat = params[:lat][:lat].to_f
      lng = params[:lng][:lat].to_f
      @postions = Item.find(:all, :conditions => ["lat between ? and ?", lat, lat-1, "lng between ? and ?", lng, lng-1])
      # @postions = Item.where(is_valid: true, status: 0, lat: params[:lat], lng: params[:lng])
    else
      params[:distance] = 1.0
    end

  end
end
