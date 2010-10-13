class SearchController < ApplicationController
  
  def index
    @title = "Advanced Search"
    @games = []
  end
  
  def results
    @games = Game.where("name like ?", "%#{params[:name]}%").where(:players => params[:number_of_players])
  end
  
  def quick_search
    @games = Game.where("name like ?", "%#{params[:query]}")
  end
  
end
