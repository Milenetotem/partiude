require 'test_helper'

class SexoControllerTest < ActionController::TestCase
  test "should get titulo:string" do
    get :titulo:string
    assert_response :success
  end

end
