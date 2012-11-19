class TrajetoGruposController < ApplicationController
  # GET /trajeto_grupos
  # GET /trajeto_grupos.json
  def index
    @trajeto_grupos = TrajetoGrupo.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @trajeto_grupos }
    end
  end

  # GET /trajeto_grupos/1
  # GET /trajeto_grupos/1.json
  def show
    @trajeto_grupo = TrajetoGrupo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @trajeto_grupo }
    end
  end

  # GET /trajeto_grupos/new
  # GET /trajeto_grupos/new.json
  def new
    @trajeto_grupo = TrajetoGrupo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @trajeto_grupo }
    end
  end

  # GET /trajeto_grupos/1/edit
  def edit
    @trajeto_grupo = TrajetoGrupo.find(params[:id])
  end

  # POST /trajeto_grupos
  # POST /trajeto_grupos.json
  def create
    @trajeto_grupo = TrajetoGrupo.new(params[:trajeto_grupo])

    respond_to do |format|
      if @trajeto_grupo.save
        format.html { redirect_to @trajeto_grupo, notice: 'Trajeto grupo was successfully created.' }
        format.json { render json: @trajeto_grupo, status: :created, location: @trajeto_grupo }
      else
        format.html { render action: "new" }
        format.json { render json: @trajeto_grupo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /trajeto_grupos/1
  # PUT /trajeto_grupos/1.json
  def update
    @trajeto_grupo = TrajetoGrupo.find(params[:id])

    respond_to do |format|
      if @trajeto_grupo.update_attributes(params[:trajeto_grupo])
        format.html { redirect_to @trajeto_grupo, notice: 'Trajeto grupo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @trajeto_grupo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trajeto_grupos/1
  # DELETE /trajeto_grupos/1.json
  def destroy
    @trajeto_grupo = TrajetoGrupo.find(params[:id])
    @trajeto_grupo.destroy

    respond_to do |format|
      format.html { redirect_to trajeto_grupos_url }
      format.json { head :no_content }
    end
  end
end
