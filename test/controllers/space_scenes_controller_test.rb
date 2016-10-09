require 'test_helper'

class SpaceScenesControllerTest < ActionController::TestCase
  setup do
    @space_scene = space_scenes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:space_scenes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create space_scene" do
    assert_difference('SpaceScene.count') do
      post :create, space_scene: { admin_panel_id: @space_scene.admin_panel_id, colour_difference: @space_scene.colour_difference, file_name: @space_scene.file_name, position_difference: @space_scene.position_difference, scene_score: @space_scene.scene_score, space_ratio: @space_scene.space_ratio, user_panel_id: @space_scene.user_panel_id, vertices_number: @space_scene.vertices_number }
    end

    assert_redirected_to space_scene_path(assigns(:space_scene))
  end

  test "should show space_scene" do
    get :show, id: @space_scene
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @space_scene
    assert_response :success
  end

  test "should update space_scene" do
    patch :update, id: @space_scene, space_scene: { admin_panel_id: @space_scene.admin_panel_id, colour_difference: @space_scene.colour_difference, file_name: @space_scene.file_name, position_difference: @space_scene.position_difference, scene_score: @space_scene.scene_score, space_ratio: @space_scene.space_ratio, user_panel_id: @space_scene.user_panel_id, vertices_number: @space_scene.vertices_number }
    assert_redirected_to space_scene_path(assigns(:space_scene))
  end

  test "should destroy space_scene" do
    assert_difference('SpaceScene.count', -1) do
      delete :destroy, id: @space_scene
    end

    assert_redirected_to space_scenes_path
  end
end
