class GamesController < ApplicationController
  # GET /games
  # GET /games.xml
  def index
    @games = Game.paginate :page => params[:page], :per_page => 10
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @games }
    end
  end

  # GET /games/1
  # GET /games/1.xml
  def show
    @game = Game.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @game }
      format.js
    end
  end

  # GET /games/new
  # GET /games/new.xml
  def new
    @game = Game.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @game }
    end
  end

  # GET /games/1/edit
  def edit
    @game = Game.find(params[:id])
  end

  # POST /games
  # POST /games.xml
  def create
    player_counts = []
    params[:game].delete(:player_counts).each {|e| (player_counts << PlayerCount.find(e)) }

    locations = []
    params[:game].delete(:locations).each {|e| (locations << Location.find(e)) }
    
    categories = []
    params[:game].delete(:categories).each {|e| (categories << Category.find(e)) }
    
    contents = []
    params[:game].delete(:contents).each {|e| (contents << Content.find(e)) }
        
    @game = Game.new(params[:game])
    @game.player_counts = player_counts

    respond_to do |format|
      if @game.save
        format.html { redirect_to(@game, :notice => 'Game was successfully created.') }
        format.xml  { render :xml => @game, :status => :created, :location => @game }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @game.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /games/1
  # PUT /games/1.xml
  def update
    @game = Game.find(params[:id])
    
    @game.player_counts = []
    player_counts = []
    params[:game].delete(:player_counts).each {|e| (player_counts << PlayerCount.find(e)) } if params[:game][:player_counts]
    
    @game.locations = []
    locations = []
    params[:game].delete(:locations).each {|e| (locations << Location.find(e)) } if params[:game][:locations]
    
    @game.categories = []
    categories = []
    params[:game].delete(:categories).each {|e| (categories << Category.find(e)) } if params[:game][:categories]
    
    @game.contents = []
    contents = []
    params[:game].delete(:contents).each {|e| (contents << Content.find(e)) } if params[:game][:contents]
    
    respond_to do |format|
      if @game.update_attributes(params[:game])
        @game.player_counts = player_counts
        @game.locations = locations
        @game.contents = contents
        @game.categories = categories
        format.html { redirect_to(@game, :notice => 'Game was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @game.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /games/1
  # DELETE /games/1.xml
  def destroy
    @game = Game.find(params[:id])
    @game.destroy

    respond_to do |format|
      format.html { redirect_to(games_url) }
      format.xml  { head :ok }
    end
  end
end
