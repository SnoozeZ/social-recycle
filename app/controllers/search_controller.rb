class SearchController < ApplicationController
  def search(item_name, category, cur_lat, cur_lng, distance)
    @item_name, @category, @cur_lat, @cur_lng, @distance = item_name, category, cur_lat, cur_lng, distance


  end
end
