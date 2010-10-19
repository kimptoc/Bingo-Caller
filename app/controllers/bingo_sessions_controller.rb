class BingoSessionsController < ApplicationController

  before_filter :authenticate_caller!, :except => [:show, :index]
  
  # GET /bingo_sessions
  # GET /bingo_sessions.xml
  def index
    @bingo_sessions = BingoSession.all(:conditions => ["is_public = ?", true])
    @my_sessions = current_caller.bingo_sessions unless current_caller.nil?

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @bingo_sessions }
    end
  end

  # GET /bingo_sessions/1
  # GET /bingo_sessions/1.xml
  def show
    @bingo_session = BingoSession.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @bingo_session }
    end
  end

  # GET /bingo_sessions/new
  # GET /bingo_sessions/new.xml
  def new
    @bingo_session = BingoSession.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @bingo_session }
    end
  end

  # GET /bingo_sessions/1/edit
  def edit
    @bingo_session = BingoSession.find(params[:id])
  end

  # POST /bingo_sessions
  # POST /bingo_sessions.xml
  def create
    @bingo_session = BingoSession.new(params[:bingo_session])
    @bingo_session.caller = current_caller

    respond_to do |format|
      if @bingo_session.save
        format.html { redirect_to(@bingo_session, :notice => 'Bingo session was successfully created.') }
        format.xml  { render :xml => @bingo_session, :status => :created, :location => @bingo_session }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @bingo_session.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /bingo_sessions/1
  # PUT /bingo_sessions/1.xml
  def update
    @bingo_session = BingoSession.find(params[:id])

    respond_to do |format|
      if @bingo_session.update_attributes(params[:bingo_session])
        format.html { redirect_to(@bingo_session, :notice => 'Bingo session was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @bingo_session.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /bingo_sessions/1
  # DELETE /bingo_sessions/1.xml
  def destroy
    @bingo_session = BingoSession.find(params[:id])
    @bingo_session.destroy

    respond_to do |format|
      format.html { redirect_to(bingo_sessions_url) }
      format.xml  { head :ok }
    end
  end
end
