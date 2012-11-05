require 'test_helper'

class CodigosControllerTest < ActionController::TestCase
  setup do
    @codigo = codigos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:codigos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create codigo" do
    assert_difference('Codigo.count') do
      post :create, :codigo => { :codigo => @codigo.codigo, :empresa_id => @codigo.empresa_id, :user_id => @codigo.user_id }
    end

    assert_redirected_to codigo_path(assigns(:codigo))
  end

  test "should show codigo" do
    get :show, :id => @codigo
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @codigo
    assert_response :success
  end

  test "should update codigo" do
    put :update, :id => @codigo, :codigo => { :codigo => @codigo.codigo, :empresa_id => @codigo.empresa_id, :user_id => @codigo.user_id }
    assert_redirected_to codigo_path(assigns(:codigo))
  end

  test "should destroy codigo" do
    assert_difference('Codigo.count', -1) do
      delete :destroy, :id => @codigo
    end

    assert_redirected_to codigos_path
  end
end
