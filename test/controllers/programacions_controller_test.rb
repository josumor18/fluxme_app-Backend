require 'test_helper'

class ProgramacionsControllerTest < ActionController::TestCase
  setup do
    @programacion = programacions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:programacions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create programacion" do
    assert_difference('Programacion.count') do
      post :create, programacion: { dia: @programacion.dia, hora: @programacion.hora, idEmisora: @programacion.idEmisora, idUser: @programacion.idUser, titulo: @programacion.titulo }
    end

    assert_redirected_to programacion_path(assigns(:programacion))
  end

  test "should show programacion" do
    get :show, id: @programacion
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @programacion
    assert_response :success
  end

  test "should update programacion" do
    patch :update, id: @programacion, programacion: { dia: @programacion.dia, hora: @programacion.hora, idEmisora: @programacion.idEmisora, idUser: @programacion.idUser, titulo: @programacion.titulo }
    assert_redirected_to programacion_path(assigns(:programacion))
  end

  test "should destroy programacion" do
    assert_difference('Programacion.count', -1) do
      delete :destroy, id: @programacion
    end

    assert_redirected_to programacions_path
  end
end
