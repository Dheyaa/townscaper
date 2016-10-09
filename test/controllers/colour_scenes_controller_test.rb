require 'test_helper'

class ColourScenesControllerTest < ActionController::TestCase
  setup do
    @colour_scene = colour_scenes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:colour_scenes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create colour_scene" do
    assert_difference('ColourScene.count') do
      post :create, colour_scene: { admin_panel_id: @colour_scene.admin_panel_id, colour_difference: @colour_scene.colour_difference, file_name: @colour_scene.file_name, position_difference: @colour_scene.position_difference, scene_score: @colour_scene.scene_score, space_ratio: @colour_scene.space_ratio, user_panel_id: @colour_scene.user_panel_id, vertices_number: @colour_scene.vertices_number }
    end

    assert_redirected_to colour_scene_path(assigns(:colour_scene))
  end

  test "should show colour_scene" do
    get :show, id: @colour_scene
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @colour_scene
    assert_response :success
  end

  test "should update colour_scene" do
    patch :update, id: @colour_scene, colour_scene: { admin_panel_id: @colour_scene.admin_panel_id, colour_difference: @colour_scene.colour_difference, file_name: @colour_scene.file_name, position_difference: @colour_scene.position_difference, scene_score: @colour_scene.scene_score, space_ratio: @colour_scene.space_ratio, user_panel_id: @colour_scene.user_panel_id, vertices_number: @colour_scene.vertices_number }
    assert_redirected_to colour_scene_path(assigns(:colour_scene))
  end

  test "should destroy colour_scene" do
    assert_difference('ColourScene.count', -1) do
      delete :destroy, id: @colour_scene
    end

    assert_redirected_to colour_scenes_path
  end
end
