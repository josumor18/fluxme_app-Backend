require 'test_helper'

class VotacionesHistoricosControllerTest < ActionController::TestCase
  setup do
    @votaciones_historico = votaciones_historicos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:votaciones_historicos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create votaciones_historico" do
    assert_difference('VotacionesHistorico.count') do
      post :create, votaciones_historico: { cancion: @votaciones_historico.cancion, id_emisora: @votaciones_historico.id_emisora, votos: @votaciones_historico.votos }
    end

    assert_redirected_to votaciones_historico_path(assigns(:votaciones_historico))
  end

  test "should show votaciones_historico" do
    get :show, id: @votaciones_historico
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @votaciones_historico
    assert_response :success
  end

  test "should update votaciones_historico" do
    patch :update, id: @votaciones_historico, votaciones_historico: { cancion: @votaciones_historico.cancion, id_emisora: @votaciones_historico.id_emisora, votos: @votaciones_historico.votos }
    assert_redirected_to votaciones_historico_path(assigns(:votaciones_historico))
  end

  test "should destroy votaciones_historico" do
    assert_difference('VotacionesHistorico.count', -1) do
      delete :destroy, id: @votaciones_historico
    end

    assert_redirected_to votaciones_historicos_path
  end
end
