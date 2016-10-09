require 'test_helper'

class VerticesScenesControllerTest < ActionController::TestCase
  setup do
    @vertices_scene = vertices_scenes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vertices_scenes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vertices_scene" do
    assert_difference('VerticesScene.count') do
      post :create, vertices_scene: { admin_panel_id: @vertices_scene.admin_panel_id, colour_difference: @vertices_scene.colour_difference, file_name: @vertices_scene.file_name, position_difference: @vertices_scene.position_difference, scene_score: @vertices_scene.scene_score, space_ratio: @vertices_scene.space_ratio, user_panel_id: @vertices_scene.user_panel_id, vertices_number: @vertices_scene.vertices_number }
    end

    assert_redirected_to vertices_scene_path(assigns(:vertices_scene))
  end

  test "should show vertices_scene" do
    get :show, id: @vertices_scene
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vertices_scene
    assert_response :success
  end

  test "should update vertices_scene" do
    patch :update, id: @vertices_scene, vertices_scene: { admin_panel_id: @vertices_scene.admin_panel_id, colour_difference: @vertices_scene.colour_difference, file_name: @vertices_scene.file_name, position_difference: @vertices_scene.position_difference, scene_score: @vertices_scene.scene_score, space_ratio: @vertices_scene.space_ratio, user_panel_id: @vertices_scene.user_panel_id, vertices_number: @vertices_scene.vertices_number }
    assert_redirected_to vertices_scene_path(assigns(:vertices_scene))
  end

  test "should destroy vertices_scene" do
    assert_difference('VerticesScene.count', -1) do
      delete :destroy, id: @vertices_scene
    end

    assert_redirected_to vertices_scenes_path
  end
end
