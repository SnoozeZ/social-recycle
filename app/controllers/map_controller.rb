class MapController < ApplicationController


  def mapsearch
    if(params[:distance])
      distance = params[:distance]
      puts "searching by distance"
      puts params[:lat]
      puts params[:lng]
      lat = params[:lat][:lat].to_f
      lng = params[:lng][:lat].to_f
      ulat = lat + distance/85.0
      llat = lat - distance/85.0
      ulng = lng + distance/111.7
      llng = lng - distance/111.7
      # @positions = Item.find(:all, :conditions => ["lat between ? and ?", -180, 180])
      @positions = Item.where("lat between ? and ?", llat, ulat,"lng between ? and ?", llng, ulng)
    else
      params[:distance] = 1.0
      @positions = Item.where("lat between ? and ?", llat, ulat,"lng between ? and ?", llng, ulng)
    end

  end
end
