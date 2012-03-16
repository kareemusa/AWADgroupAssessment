require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end
  
  test "should login" do
    dave = members(:one)
    post :create, name: dave.name, password: 'secret'
    
    assert_equal dave.id, session[:member_id]
    assert_redirected_to admin_url
  end
  
  test "should fail login" do
    dave = members(:one)
    post :create, name: dave.name, password: 'wrong'
    assert_redirected_to login_url
  end
  
  test "should logout" do
    delete :destroy
    assert_redirected_to movie_url
  end

end
