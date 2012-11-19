require 'test_helper'

class TrajetoGruposControllerTest < ActionController::TestCase
  setup do
    @trajeto_grupo = trajeto_grupos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:trajeto_grupos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create trajeto_grupo" do
    assert_difference('TrajetoGrupo.count') do
      post :create, trajeto_grupo: { grupo_id: @trajeto_grupo.grupo_id, trajeto_usuario_id: @trajeto_grupo.trajeto_usuario_id }
    end

    assert_redirected_to trajeto_grupo_path(assigns(:trajeto_grupo))
  end

  test "should show trajeto_grupo" do
    get :show, id: @trajeto_grupo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @trajeto_grupo
    assert_response :success
  end

  test "should update trajeto_grupo" do
    put :update, id: @trajeto_grupo, trajeto_grupo: { grupo_id: @trajeto_grupo.grupo_id, trajeto_usuario_id: @trajeto_grupo.trajeto_usuario_id }
    assert_redirected_to trajeto_grupo_path(assigns(:trajeto_grupo))
  end

  test "should destroy trajeto_grupo" do
    assert_difference('TrajetoGrupo.count', -1) do
      delete :destroy, id: @trajeto_grupo
    end

    assert_redirected_to trajeto_grupos_path
  end
end
