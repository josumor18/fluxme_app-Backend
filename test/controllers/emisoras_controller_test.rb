require 'test_helper'

class EmisorasControllerTest < ActionController::TestCase
  setup do
    @emisora = emisoras(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:emisoras)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create emisora" do
    assert_difference('Emisora.count') do
      post :create, emisora: { id_admin: @emisora.id_admin, link: @emisora.link, nombre: @emisora.nombre }
    end

    assert_redirected_to emisora_path(assigns(:emisora))
  end

  test "should show emisora" do
    get :show, id: @emisora
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @emisora
    assert_response :success
  end

  test "should update emisora" do
    patch :update, id: @emisora, emisora: { id_admin: @emisora.id_admin, link: @emisora.link, nombre: @emisora.nombre }
    assert_redirected_to emisora_path(assigns(:emisora))
  end

  test "should destroy emisora" do
    assert_difference('Emisora.count', -1) do
      delete :destroy, id: @emisora
    end

    assert_redirected_to emisoras_path
  end
end
