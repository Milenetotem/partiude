class InstituicaosController < ApplicationController
  # GET /instituicaos
  # GET /instituicaos.json
  def index
    @instituicaos = Instituicao.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @instituicaos }
    end
  end

  # GET /instituicaos/1
  # GET /instituicaos/1.json
  def show
    @instituicao = Instituicao.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @instituicao }
    end
  end

  # GET /instituicaos/new
  # GET /instituicaos/new.json
  def new
    @instituicao = Instituicao.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @instituicao }
    end
  end

  # GET /instituicaos/1/edit
  def edit
    @instituicao = Instituicao.find(params[:id])
  end

  # POST /instituicaos
  # POST /instituicaos.json
  def create
    @instituicao = Instituicao.new(params[:instituicao])

    respond_to do |format|
      if @instituicao.save
        format.html { redirect_to @instituicao, :notice => 'Instituicao was successfully created.' }
        format.json { render :json => @instituicao, :status => :created, :location => @instituicao }
      else
        format.html { render :action => "new" }
        format.json { render :json => @instituicao.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /instituicaos/1
  # PUT /instituicaos/1.json
  def update
    @instituicao = Instituicao.find(params[:id])

    respond_to do |format|
      if @instituicao.update_attributes(params[:instituicao])
        format.html { redirect_to @instituicao, :notice => 'Instituicao was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @instituicao.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /instituicaos/1
  # DELETE /instituicaos/1.json
  def destroy
    @instituicao = Instituicao.find(params[:id])
    @instituicao.destroy

    respond_to do |format|
      format.html { redirect_to instituicaos_url }
      format.json { head :no_content }
    end
  end
end
