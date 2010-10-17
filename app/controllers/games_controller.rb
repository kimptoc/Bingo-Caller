class GamesController < ApplicationController

  before_filter :authenticate_caller!, :except => [:show, :index]

   def next_ball
    @game = Game.find(params[:id])

    @game.next_ball

    redirect_to @game
   end

  def enable_auto
    @game = Game.find(params[:id])
    caller_session['auto'] = true
    redirect_to @game
  end

  def disable_auto
    @game = Game.find(params[:id])
    caller_session['auto'] = false
    redirect_to @game
  end

  # GET /games
  # GET /games.xml
  def index
    @games = Game.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @games }
    end
  end

  # GET /games/1
  # GET /games/1.xml
  def show
    @game = Game.find(params[:id])

    auto = caller_session['auto']
    if auto == nil
      auto = false
    end
    caller_session['auto'] = auto
    
    #hack, should scan dirs for options and choose from them
    #and/or give user choice of which caller to use...
    if rand(10) % 2 == 0
      @caller_sound = "/callers/chris1/#{@game.last_ball_called}.mp3"
    else
      @caller_sound = "/callers/jav1/#{@game.last_ball_called}.mp3"
    end

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @game }
    end
  end

  # GET /games/new
  # GET /games/new.xml
  def new
    @game = Game.new

    bs_id = params['bingo_session_id']
    if bs_id
      @bingo_session = BingoSession.find(bs_id)
    end

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
    @game = Game.new(params[:game])

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

    respond_to do |format|
      if @game.update_attributes(params[:game])
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
