require 'test_helper'

class VotacionesHistsControllerTest < ActionController::TestCase
  setup do
    @votaciones_hist = votaciones_hists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:votaciones_hists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create votaciones_hist" do
    assert_difference('VotacionesHist.count') do
      post :create, votaciones_hist: { cancion: @votaciones_hist.cancion, id_cancion: @votaciones_hist.id_cancion, id_emisora: @votaciones_hist.id_emisora, votos: @votaciones_hist.votos }
    end

    assert_redirected_to votaciones_hist_path(assigns(:votaciones_hist))
  end

  test "should show votaciones_hist" do
    get :show, id: @votaciones_hist
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @votaciones_hist
    assert_response :success
  end

  test "should update votaciones_hist" do
    patch :update, id: @votaciones_hist, votaciones_hist: { cancion: @votaciones_hist.cancion, id_cancion: @votaciones_hist.id_cancion, id_emisora: @votaciones_hist.id_emisora, votos: @votaciones_hist.votos }
    assert_redirected_to votaciones_hist_path(assigns(:votaciones_hist))
  end

  test "should destroy votaciones_hist" do
    assert_difference('VotacionesHist.count', -1) do
      delete :destroy, id: @votaciones_hist
    end

    assert_redirected_to votaciones_hists_path
  end
end
