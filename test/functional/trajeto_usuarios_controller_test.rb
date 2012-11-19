require 'test_helper'

class TrajetoUsuariosControllerTest < ActionController::TestCase
  setup do
    @trajeto_usuario = trajeto_usuarios(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:trajeto_usuarios)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create trajeto_usuario" do
    assert_difference('TrajetoUsuario.count') do
      post :create, trajeto_usuario: { trajeto_usuario_destino_id: @trajeto_usuario.trajeto_usuario_destino_id, trajeto_usuario_origem_id: @trajeto_usuario.trajeto_usuario_origem_id }
    end

    assert_redirected_to trajeto_usuario_path(assigns(:trajeto_usuario))
  end

  test "should show trajeto_usuario" do
    get :show, id: @trajeto_usuario
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @trajeto_usuario
    assert_response :success
  end

  test "should update trajeto_usuario" do
    put :update, id: @trajeto_usuario, trajeto_usuario: { trajeto_usuario_destino_id: @trajeto_usuario.trajeto_usuario_destino_id, trajeto_usuario_origem_id: @trajeto_usuario.trajeto_usuario_origem_id }
    assert_redirected_to trajeto_usuario_path(assigns(:trajeto_usuario))
  end

  test "should destroy trajeto_usuario" do
    assert_difference('TrajetoUsuario.count', -1) do
      delete :destroy, id: @trajeto_usuario
    end

    assert_redirected_to trajeto_usuarios_path
  end
end
