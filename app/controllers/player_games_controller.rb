class PlayerGamesController < ApplicationController

  before_filter :authenticate_caller!

  # GET /player_games
  # GET /player_games.xml
  def index
    @player_games = PlayerGame.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @player_games }
    end
  end

  # GET /player_games/1
  # GET /player_games/1.xml
  def show
    @player_game = PlayerGame.find(params[:id])

    redirect_to @player_game.game, :stab => 1

  end

  # GET /player_games/new
  # GET /player_games/new.xml
  def new
    @player_game = PlayerGame.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @player_game }
    end
  end

  # GET /player_games/1/edit
  def edit
    @player_game = PlayerGame.find(params[:id])
  end

  # POST /player_games
  # POST /player_games.xml
  def create
    @player_game = PlayerGame.new(params[:player_game])

    if params['player_other'] != nil and params['player_other'].length > 0 
      p = Player.new
      p.name = params['player_other']
      p.bingo_session = @player_game.game.bingo_session
      p.save!
      @player_game.player = p
    end

    respond_to do |format|
      if @player_game.save
        format.html { redirect_to(@player_game, :notice => 'Player game was successfully created.') }
        format.xml  { render :xml => @player_game, :status => :created, :location => @player_game }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @player_game.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /player_games/1
  # PUT /player_games/1.xml
  def update
    @player_game = PlayerGame.find(params[:id])

    respond_to do |format|
      if @player_game.update_attributes(params[:player_game])
        format.html { redirect_to(@player_game, :notice => 'Player game was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @player_game.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /player_games/1
  # DELETE /player_games/1.xml
  def destroy
    @player_game = PlayerGame.find(params[:id])
    @player_game.destroy

    respond_to do |format|
      format.html { redirect_to(player_games_path, :notice => 'Player game was successfully removed.') }
      format.xml  { head :ok }
    end
  end
end
