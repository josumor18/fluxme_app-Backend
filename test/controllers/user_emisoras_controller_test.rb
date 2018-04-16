require 'test_helper'

class UserEmisorasControllerTest < ActionController::TestCase
  setup do
    @user_emisora = user_emisoras(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_emisoras)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_emisora" do
    assert_difference('UserEmisora.count') do
      post :create, user_emisora: { idEmisora: @user_emisora.idEmisora, idUser: @user_emisora.idUser }
    end

    assert_redirected_to user_emisora_path(assigns(:user_emisora))
  end

  test "should show user_emisora" do
    get :show, id: @user_emisora
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_emisora
    assert_response :success
  end

  test "should update user_emisora" do
    patch :update, id: @user_emisora, user_emisora: { idEmisora: @user_emisora.idEmisora, idUser: @user_emisora.idUser }
    assert_redirected_to user_emisora_path(assigns(:user_emisora))
  end

  test "should destroy user_emisora" do
    assert_difference('UserEmisora.count', -1) do
      delete :destroy, id: @user_emisora
    end

    assert_redirected_to user_emisoras_path
  end
end
