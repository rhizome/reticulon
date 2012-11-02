require 'test_helper'

class UsersControllerTest < ActionController::TestCase

  setup do
    @user = FactoryGirl.create(:unconfirmed_user)
  end

  test "should get index" do
    get :index
    assert_response :success
  end

end
