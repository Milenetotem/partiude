require 'test_helper'

class MeioTransportesControllerTest < ActionController::TestCase
  setup do
    @meio_transporte = meio_transportes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:meio_transportes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create meio_transporte" do
    assert_difference('MeioTransporte.count') do
      post :create, :meio_transporte => { :grupo_id => @meio_transporte.grupo_id, :icone => @meio_transporte.icone, :nome => @meio_transporte.nome }
    end

    assert_redirected_to meio_transporte_path(assigns(:meio_transporte))
  end

  test "should show meio_transporte" do
    get :show, :id => @meio_transporte
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @meio_transporte
    assert_response :success
  end

  test "should update meio_transporte" do
    put :update, :id => @meio_transporte, :meio_transporte => { :grupo_id => @meio_transporte.grupo_id, :icone => @meio_transporte.icone, :nome => @meio_transporte.nome }
    assert_redirected_to meio_transporte_path(assigns(:meio_transporte))
  end

  test "should destroy meio_transporte" do
    assert_difference('MeioTransporte.count', -1) do
      delete :destroy, :id => @meio_transporte
    end

    assert_redirected_to meio_transportes_path
  end
end
