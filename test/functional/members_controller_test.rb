require 'test_helper'

class MembersControllerTest < ActionController::TestCase
  setup do
    @input_attributes = {
      name:                         "sam",
      password:                     "private",
      password_confirmation:        "private"
    }
    @member = members(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:members)
  end

  test "should get new" do
    get :new
    assert_response :success
  end
  
test "should login" do
 dave = members(:one)
 post :create, name: dave.name, password: 'secret'
 assert_redirected_to admin_url
 assert_equal dave.id, session[:member_id]
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
  
  

  test "should create member" do
    assert_difference('Member.count') do
      post :create, member: @input_attributes
    end

    assert_redirected_to members_path
  end

  test "should show member" do
    get :show, id: @member
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @member
    assert_response :success
  end

  test "should update member" do
    put :update, id: @member.to_param, member: @input_attributes
    assert_redirected_to members_path
  end

  test "should destroy member" do
    assert_difference('Member.count', -1) do
      delete :destroy, id: @member
    end

    assert_redirected_to members_path
  end
end
