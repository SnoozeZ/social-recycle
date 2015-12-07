class MapController < ApplicationController


  def mapsearch
    if(params[:distance])
      distance = params[:distance]
      puts "searching by distance"
      puts params[:lat]
      puts params[:lng]
      lat = params[:lat][:lat].to_f
      lng = params[:lng][:lat].to_f
      # @positions = Item.find(:all, :conditions => ["lat between ? and ?", -180, 180])
      @positions = Item.where("lat between ? and ?", -180, 180)
    else
      params[:distance] = 1.0
      @positions = Item.where("lat between ? and ?", -180, 180)
    end

  end
end
