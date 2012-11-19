class TrajetoUsuariosController < ApplicationController
  # GET /trajeto_usuarios
  # GET /trajeto_usuarios.json
  def index
    @trajeto_usuarios = TrajetoUsuario.all
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @trajeto_usuarios }
    end
  end

  # GET /trajeto_usuarios/1
  # GET /trajeto_usuarios/1.json
  def show
    @trajeto_usuario = TrajetoUsuario.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @trajeto_usuario }
    end
  end

  # GET /trajeto_usuarios/new
  # GET /trajeto_usuarios/new.json
  def new
    @trajeto_usuario = TrajetoUsuario.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @trajeto_usuario }
    end
  end

  # GET /trajeto_usuarios/1/edit
  def edit
    @trajeto_usuario = TrajetoUsuario.find(params[:id])
  end

  # POST /trajeto_usuarios
  # POST /trajeto_usuarios.json
  def create
    @trajeto_usuario = TrajetoUsuario.new(params[:trajeto_usuario])

    respond_to do |format|
      if @trajeto_usuario.save
        format.html { redirect_to @trajeto_usuario, notice: 'Trajeto usuario was successfully created.' }
        format.json { render json: @trajeto_usuario, status: :created, location: @trajeto_usuario }
      else
        format.html { render action: "new" }
        format.json { render json: @trajeto_usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /trajeto_usuarios/1
  # PUT /trajeto_usuarios/1.json
  def update
    @trajeto_usuario = TrajetoUsuario.find(params[:id])

    respond_to do |format|
      if @trajeto_usuario.update_attributes(params[:trajeto_usuario])
        format.html { redirect_to @trajeto_usuario, notice: 'Trajeto usuario was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @trajeto_usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trajeto_usuarios/1
  # DELETE /trajeto_usuarios/1.json
  def destroy
    @trajeto_usuario = TrajetoUsuario.find(params[:id])
    @trajeto_usuario.destroy

    respond_to do |format|
      format.html { redirect_to trajeto_usuarios_url }
      format.json { head :no_content }
    end
  end
end
