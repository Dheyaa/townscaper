require 'test_helper'

class PositionScenesControllerTest < ActionController::TestCase
  setup do
    @position_scene = position_scenes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:position_scenes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create position_scene" do
    assert_difference('PositionScene.count') do
      post :create, position_scene: { admin_panel_id: @position_scene.admin_panel_id, colour_difference: @position_scene.colour_difference, file_name: @position_scene.file_name, position_difference: @position_scene.position_difference, scene_score: @position_scene.scene_score, space_ratio: @position_scene.space_ratio, user_panel_id: @position_scene.user_panel_id, vertices_number: @position_scene.vertices_number }
    end

    assert_redirected_to position_scene_path(assigns(:position_scene))
  end

  test "should show position_scene" do
    get :show, id: @position_scene
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @position_scene
    assert_response :success
  end

  test "should update position_scene" do
    patch :update, id: @position_scene, position_scene: { admin_panel_id: @position_scene.admin_panel_id, colour_difference: @position_scene.colour_difference, file_name: @position_scene.file_name, position_difference: @position_scene.position_difference, scene_score: @position_scene.scene_score, space_ratio: @position_scene.space_ratio, user_panel_id: @position_scene.user_panel_id, vertices_number: @position_scene.vertices_number }
    assert_redirected_to position_scene_path(assigns(:position_scene))
  end

  test "should destroy position_scene" do
    assert_difference('PositionScene.count', -1) do
      delete :destroy, id: @position_scene
    end

    assert_redirected_to position_scenes_path
  end
end
