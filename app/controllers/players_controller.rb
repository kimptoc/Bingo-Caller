class PlayersController < ApplicationController

  before_filter :authenticate_caller!

  # GET /called_numbers/1
  # GET /called_numbers/1.xml
  def show
    @player = Player.find(params[:id])

    #todo - want to select the players tab, but stab param not being passed through
    redirect_to @player.bingo_session.games.last, :stab => 1 unless @player.bingo_session.games.length == 0
    redirect_to @player.bingo_session if @player.bingo_session.games.length == 0
  end

  # GET /called_numbers/new
  # GET /called_numbers/new.xml
  def new
    @player = Player.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @player }
    end
  end

  # GET /called_numbers/1/edit
  def edit
    @player = Player.find(params[:id])
  end

  # POST /called_numbers
  # POST /called_numbers.xml
  def create
    @player = Player.new(params[:player])
    @player.caller = current_caller

    respond_to do |format|
      if @player.save
        format.html { redirect_to(@player, :notice => 'Player was successfully created.') }
        format.xml  { render :xml => @player, :status => :created, :location => @player }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @player.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /players/1
  # PUT /players/1.xml
  def update
    @player = Player.find(params[:id])

    respond_to do |format|
      if @player.update_attributes(params[:player])
        format.html { redirect_to(@player, :notice => 'Player was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @player.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /players/1
  # DELETE /players/1.xml
  def destroy
    @player = Player.find(params[:id])
    @player.destroy

    respond_to do |format|
      format.html { redirect_to(players_url) }
      format.xml  { head :ok }
    end
  end
end
