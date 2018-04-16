require 'test_helper'

class TrendingsControllerTest < ActionController::TestCase
  setup do
    @trending = trendings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:trendings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create trending" do
    assert_difference('Trending.count') do
      post :create, trending: { artista: @trending.artista, cancion: @trending.cancion, id_emisora: @trending.id_emisora, imagen: @trending.imagen, posicion: @trending.posicion }
    end

    assert_redirected_to trending_path(assigns(:trending))
  end

  test "should show trending" do
    get :show, id: @trending
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @trending
    assert_response :success
  end

  test "should update trending" do
    patch :update, id: @trending, trending: { artista: @trending.artista, cancion: @trending.cancion, id_emisora: @trending.id_emisora, imagen: @trending.imagen, posicion: @trending.posicion }
    assert_redirected_to trending_path(assigns(:trending))
  end

  test "should destroy trending" do
    assert_difference('Trending.count', -1) do
      delete :destroy, id: @trending
    end

    assert_redirected_to trendings_path
  end
end
