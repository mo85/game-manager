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
