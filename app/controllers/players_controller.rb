class PlayersController < ApplicationController

  before_filter :authenticate_caller!

  def index
    bingo_session = BingoSession.find(params[:bingo_session_id])
    @players = bingo_session.players
    respond_to do |format|
      #format.html # new.html.erb
      format.xml  { render :xml => @players }
      format.json { render :json => @players}
    end
  end

  # GET /called_numbers/1
  # GET /called_numbers/1.xml
  def show
    bingo_session = BingoSession.find(params[:bingo_session_id])
    @player = bingo_session.players.find(params[:id])

    next_page = [@player.bingo_session.games.last, :stab => 1] unless @player.bingo_session.games.length == 0
    next_page = @player.bingo_session if @player.bingo_session.games.length == 0

    #todo - want to select the players tab, but stab param not being passed through
    respond_to do |format|
      format.html { redirect_to(next_page) }
      format.json { render :json => @player}
    end
  end

  # GET /called_numbers/new
  # GET /called_numbers/new.xml
  def new
    bingo_session = BingoSession.find(params[:bingo_session_id])
    @player = Player.new
    @player.bingo_session = bingo_session

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @player }
      format.json { render :json => @player}
    end
  end

  # GET /called_numbers/1/edit
  def edit
    bingo_session = BingoSession.find(params[:bingo_session_id])
    @player = bingo_session.players.find(params[:id])
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @player }
      format.json { render :json => @player}
    end
  end

  # POST /called_numbers
  # POST /called_numbers.xml
  def create
    bingo_session = BingoSession.find(params[:bingo_session_id])
    @player = Player.new(params[:player])
    @player.bingo_session = bingo_session
    @player.caller = current_caller

    respond_to do |format|
      if @player.save
        format.html { redirect_to(@player, :notice => 'Player was successfully created.') }
        format.xml  { render :xml => @player, :status => :created, :location => @player }
        format.json { render :json => @player}
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @player.errors, :status => :unprocessable_entity }
        format.json  { render :json => @player.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /players/1
  # PUT /players/1.xml
  def update
    bingo_session = BingoSession.find(params[:bingo_session_id])
    @player = bingo_session.players.find(params[:id])

    respond_to do |format|
      if @player.update_attributes(params[:player])
        format.html { redirect_to(@player, :notice => 'Player was successfully updated.') }
        format.xml  { head :ok }
        format.json { render :json => @player}
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @player.errors, :status => :unprocessable_entity }
        format.json  { render :json => @player.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /players/1
  # DELETE /players/1.xml
  def destroy
    bingo_session = BingoSession.find(params[:bingo_session_id])
    @player = bingo_session.players.find(params[:id])
    @player.destroy

    respond_to do |format|
      format.html { redirect_to(players_url) }
      format.xml  { head :ok }
      format.json  { head :ok }
    end
  end
end
