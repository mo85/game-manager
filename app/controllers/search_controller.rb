class SearchController < ApplicationController
  
  def index
    @title = "Advanced Search"
    @games = []
  end
  
  def results
    @games = Game.where("name like ?", "%#{params[:name]}%")
  end
  
  def quick_search
    @games = Game.where("name like ?", "%#{params[:query]}")
  end
  
end
