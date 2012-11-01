require 'test_helper'

class UsersControllerTest < ActionController::TestCase

  setup do
    @user = FactoryGirl.create(:unconfirmed_user)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should show user" do
    get :show, id: @user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user
    assert_response :success
  end

  test "should update user" do
    put :update, id: @user, user: {  }
    assert_redirected_to user_path(assigns(:user))
  end

end