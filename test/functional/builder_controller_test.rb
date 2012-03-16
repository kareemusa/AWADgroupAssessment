require 'test_helper'

class BuilderControllerTest < ActionController::TestCase
  test "should get alpha" do
    get :alpha
    assert_response :success
  end

end
