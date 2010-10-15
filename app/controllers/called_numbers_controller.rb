class CalledNumbersController < ApplicationController
  # GET /called_numbers
  # GET /called_numbers.xml
  def index
    @called_numbers = CalledNumber.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @called_numbers }
    end
  end

  # GET /called_numbers/1
  # GET /called_numbers/1.xml
  def show
    @called_number = CalledNumber.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @called_number }
    end
  end

  # GET /called_numbers/new
  # GET /called_numbers/new.xml
  def new
    @called_number = CalledNumber.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @called_number }
    end
  end

  # GET /called_numbers/1/edit
  def edit
    @called_number = CalledNumber.find(params[:id])
  end

  # POST /called_numbers
  # POST /called_numbers.xml
  def create
    @called_number = CalledNumber.new(params[:called_number])

    respond_to do |format|
      if @called_number.save
        format.html { redirect_to(@called_number, :notice => 'Called number was successfully created.') }
        format.xml  { render :xml => @called_number, :status => :created, :location => @called_number }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @called_number.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /called_numbers/1
  # PUT /called_numbers/1.xml
  def update
    @called_number = CalledNumber.find(params[:id])

    respond_to do |format|
      if @called_number.update_attributes(params[:called_number])
        format.html { redirect_to(@called_number, :notice => 'Called number was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @called_number.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /called_numbers/1
  # DELETE /called_numbers/1.xml
  def destroy
    @called_number = CalledNumber.find(params[:id])
    @called_number.destroy

    respond_to do |format|
      format.html { redirect_to(called_numbers_url) }
      format.xml  { head :ok }
    end
  end
end
