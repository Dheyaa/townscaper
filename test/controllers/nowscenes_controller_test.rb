require 'test_helper'

class NowscenesControllerTest < ActionController::TestCase
  setup do
    @nowscene = nowscenes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:nowscenes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create nowscene" do
    assert_difference('Nowscene.count') do
      post :create, nowscene: { admin_panel_id: @nowscene.admin_panel_id, colour_difference: @nowscene.colour_difference, file_name: @nowscene.file_name, position_difference: @nowscene.position_difference, scene_score: @nowscene.scene_score, space_ratio: @nowscene.space_ratio, user_panel_id: @nowscene.user_panel_id, vertices_number: @nowscene.vertices_number }
    end

    assert_redirected_to nowscene_path(assigns(:nowscene))
  end

  test "should show nowscene" do
    get :show, id: @nowscene
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @nowscene
    assert_response :success
  end

  test "should update nowscene" do
    patch :update, id: @nowscene, nowscene: { admin_panel_id: @nowscene.admin_panel_id, colour_difference: @nowscene.colour_difference, file_name: @nowscene.file_name, position_difference: @nowscene.position_difference, scene_score: @nowscene.scene_score, space_ratio: @nowscene.space_ratio, user_panel_id: @nowscene.user_panel_id, vertices_number: @nowscene.vertices_number }
    assert_redirected_to nowscene_path(assigns(:nowscene))
  end

  test "should destroy nowscene" do
    assert_difference('Nowscene.count', -1) do
      delete :destroy, id: @nowscene
    end

    assert_redirected_to nowscenes_path
  end
end
