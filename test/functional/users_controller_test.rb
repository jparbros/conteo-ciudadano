require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
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

  test "should create user" do
    assert_difference('User.count') do
      post :create, :user => { :crypted_password => @user.crypted_password, :email => @user.email, :password_salt => @user.password_salt, :perishable_token => @user.perishable_token, :persistence_token => @user.persistence_token, :single_access_token => @user.single_access_token }
    end

    assert_redirected_to user_path(assigns(:user))
  end

  test "should show user" do
    get :show, :id => @user
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @user
    assert_response :success
  end

  test "should update user" do
    put :update, :id => @user, :user => { :crypted_password => @user.crypted_password, :email => @user.email, :password_salt => @user.password_salt, :perishable_token => @user.perishable_token, :persistence_token => @user.persistence_token, :single_access_token => @user.single_access_token }
    assert_redirected_to user_path(assigns(:user))
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, :id => @user
    end

    assert_redirected_to users_path
  end
end
