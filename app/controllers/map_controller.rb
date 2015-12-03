class MapController < ApplicationController


  def mapsearch
    if(params[:distance])
      distance = params[:distance]

    else
      params[:distance] = 1.0
    end

  end
end
