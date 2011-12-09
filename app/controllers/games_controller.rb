class GamesController < ApplicationController

  before_filter :authenticate_caller!, :except => [:show, :index]

   def next_ball
    @game = Game.find(params[:id])

    @game.next_ball

    redirect_to @game

   end

  def record_winner_line
    @game = Game.find(params[:id])
    player = @game.bingo_session.players.find(params[:player_with_first_line])

    @game.player_with_first_line = player

    @game.save!
    
    redirect_to @game
  end

  def record_winner_bingo
    @game = Game.find(params[:id])
    player = @game.bingo_session.players.find(params[:player_with_bingo])

    @game.player_with_bingo = player

    @game.save!

    redirect_to @game
  end

  def same_again
    game = Game.find(params[:id])

    new_game = Game.copy_game game

    redirect_to new_game

  end

  def auto_toggle
    @game = Game.find(params[:id])
    caller_session['auto'] = ! caller_session['auto']
    redirect_to @game
  end

  #def enable_auto
  #  @game = Game.find(params[:id])
  #  caller_session['auto'] = true
  #  redirect_to @game
  #end

  #def disable_auto
  #  @game = Game.find(params[:id])
  #  caller_session['auto'] = false
  #  respond_to do |format|
  #    format.html {
  #      Rails.logger.info "disable_auto - redirect to game/show"
  #      redirect_to @game
  #    }
  #    format.xml  { render :xml => @game }
  #  end
  #end

  # GET /games
  # GET /games.xml
  def index
    @games = Game.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @games }
    end
  end

  def get_sound_file(game)
    return "" unless game.last_ball_called.present?
    if rand(10) % 2 == 0
      caller_sound = "/callers/chris1/#{game.last_ball_called}.mp3"
    else
      caller_sound = "/callers/jav1/#{game.last_ball_called}.mp3"
    end
    return caller_sound
  end

  # GET /games/1
  # GET /games/1.xml
  def show
    Rails.logger.debug "GamesController.show"
    @game = Game.find(params[:id])
    @player = Player.new
    @player.bingo_session = @game.bingo_session
    @player_game = PlayerGame.new
    @player_game.game = @game

    auto = caller_session['auto']
    if auto == nil
      auto = false
    end
    caller_session['auto'] = auto
    
    #hack, should scan dirs for options and choose from them
    #and/or give user choice of which caller to use...
    @caller_sound = get_sound_file(@game)

    respond_to do |format|
      format.html { render :html => @game, :stab => params['stab'] } # show.html.erb
      format.xml  { render :xml => @game }
    end
  end

  def get_game_status
    game = Game.find(params[:id])
    game_json = {}
    if game.present?
      called_balls = game.called_numbers.select(:called_ball).order(:called_time).reverse.map { |b| b.called_ball }
      game_json[:called_balls] = called_balls
      game_json[:all_balls] = (1..game.max_balls).to_a
    end
    game_json[:player_with_first_line_id] = game.player_with_first_line_id
    game_json[:player_with_bingo_id] = game.player_with_bingo_id
    game_json[:auto_mode] = caller_session['auto']
    game_json[:secs_between_calls] = game.secs_between_calls
    game_json[:current_call_sound] = get_sound_file(game)
    return game_json
  end

  def game_status
    game_json = get_game_status()
    #respond_with(game_json)
    respond_to do |format|
      format.json  { render :json => game_json }
    end

  end

  # GET /games/new
  # GET /games/new.xml
  def new
    @game = Game.new

    bs_id = params['bingo_session_id']
    if bs_id
      @bingo_session = BingoSession.find(bs_id)
    else
      @bingo_session = BingoSession.new
      @bingo_session.caller = current_caller
      @bingo_session.save!
    end
    @game.game_number = @bingo_session.games.count + 1

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

    if @game.bingo_session == nil
      @game.bingo_session = BingoSession.new
      @game.bingo_session.caller = current_caller
      @game.bingo_session.save!
    end

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
