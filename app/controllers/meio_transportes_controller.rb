class MeioTransportesController < ApplicationController
  # GET /meio_transportes
  # GET /meio_transportes.json
  def index
    @meio_transportes = MeioTransporte.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @meio_transportes }
    end
  end

  # GET /meio_transportes/1
  # GET /meio_transportes/1.json
  def show
    @meio_transporte = MeioTransporte.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @meio_transporte }
    end
  end

  # GET /meio_transportes/new
  # GET /meio_transportes/new.json
  def new
    @meio_transporte = MeioTransporte.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @meio_transporte }
    end
  end

  # GET /meio_transportes/1/edit
  def edit
    @meio_transporte = MeioTransporte.find(params[:id])
  end

  # POST /meio_transportes
  # POST /meio_transportes.json
  def create
    @meio_transporte = MeioTransporte.new(params[:meio_transporte])

    respond_to do |format|
      if @meio_transporte.save
        format.html { redirect_to @meio_transporte, :notice => 'Meio transporte was successfully created.' }
        format.json { render :json => @meio_transporte, :status => :created, :location => @meio_transporte }
      else
        format.html { render :action => "new" }
        format.json { render :json => @meio_transporte.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /meio_transportes/1
  # PUT /meio_transportes/1.json
  def update
    @meio_transporte = MeioTransporte.find(params[:id])

    respond_to do |format|
      if @meio_transporte.update_attributes(params[:meio_transporte])
        format.html { redirect_to @meio_transporte, :notice => 'Meio transporte was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @meio_transporte.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /meio_transportes/1
  # DELETE /meio_transportes/1.json
  def destroy
    @meio_transporte = MeioTransporte.find(params[:id])
    @meio_transporte.destroy

    respond_to do |format|
      format.html { redirect_to meio_transportes_url }
      format.json { head :no_content }
    end
  end
end
