require 'test_helper'

class LocalizacionStatsControllerTest < ActionController::TestCase
  setup do
    @localizacion_stat = localizacion_stats(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:localizacion_stats)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create localizacion_stat" do
    assert_difference('LocalizacionStat.count') do
      post :create, localizacion_stat: { ciudad: @localizacion_stat.ciudad, id_emisora: @localizacion_stat.id_emisora, id_user: @localizacion_stat.id_user, latitud: @localizacion_stat.latitud, longitud: @localizacion_stat.longitud, pais: @localizacion_stat.pais }
    end

    assert_redirected_to localizacion_stat_path(assigns(:localizacion_stat))
  end

  test "should show localizacion_stat" do
    get :show, id: @localizacion_stat
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @localizacion_stat
    assert_response :success
  end

  test "should update localizacion_stat" do
    patch :update, id: @localizacion_stat, localizacion_stat: { ciudad: @localizacion_stat.ciudad, id_emisora: @localizacion_stat.id_emisora, id_user: @localizacion_stat.id_user, latitud: @localizacion_stat.latitud, longitud: @localizacion_stat.longitud, pais: @localizacion_stat.pais }
    assert_redirected_to localizacion_stat_path(assigns(:localizacion_stat))
  end

  test "should destroy localizacion_stat" do
    assert_difference('LocalizacionStat.count', -1) do
      delete :destroy, id: @localizacion_stat
    end

    assert_redirected_to localizacion_stats_path
  end
end
