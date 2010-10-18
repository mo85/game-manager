class SearchController < ApplicationController
  
  def index
    @title = "Advanced Search"
    @games = []
  end
  
  def results
    puts params
    
    name = params[:game][:keyword]
    
    @games = simple_query(name)
    
    unless params[:game][:form].blank?
      @games = @games.where(:form => params[:game][:form])
    end
    
    unless params[:game][:intensity].blank?
      @games = @games.where(:intensity => params[:game][:intensity])
    end
    
    unless params[:game][:location].blank?
      @games = @games.joins(:locations).where("locations.id = ?", params[:game][:location])
    end
    
    unless params[:game][:player_count].blank?
      @games = @games.joins(:player_counts).where("player_count_id = ?", params[:game][:player_count])
    end
    
    unless params[:game][:category].blank?
      @games = @games.joins(:categories).where("category_id = ?", params[:game][:category])
    end
    
    unless params[:game][:content].blank?
      @games = @games.joins(:contents).where("content_id = ?", params[:game][:content])
    end
    
  end
  
  def quick_search
    @games = simple_query params[:game][:query]
    
    respond_to do |format|
      format.js
    end
    
  end
  
  private
  
  def simple_query(query)
    t = Game.arel_table
    Game.where(t[:name].matches("%#{query}%"))
  end
  
end
