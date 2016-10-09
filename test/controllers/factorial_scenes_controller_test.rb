require 'test_helper'

class FactorialScenesControllerTest < ActionController::TestCase
  setup do
    @factorial_scene = factorial_scenes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:factorial_scenes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create factorial_scene" do
    assert_difference('FactorialScene.count') do
      post :create, factorial_scene: { admin_panel_id: @factorial_scene.admin_panel_id, colour_difference: @factorial_scene.colour_difference, file_name: @factorial_scene.file_name, position_difference: @factorial_scene.position_difference, scene_score: @factorial_scene.scene_score, space_ratio: @factorial_scene.space_ratio, user_panel_id: @factorial_scene.user_panel_id, vertices_number: @factorial_scene.vertices_number }
    end

    assert_redirected_to factorial_scene_path(assigns(:factorial_scene))
  end

  test "should show factorial_scene" do
    get :show, id: @factorial_scene
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @factorial_scene
    assert_response :success
  end

  test "should update factorial_scene" do
    patch :update, id: @factorial_scene, factorial_scene: { admin_panel_id: @factorial_scene.admin_panel_id, colour_difference: @factorial_scene.colour_difference, file_name: @factorial_scene.file_name, position_difference: @factorial_scene.position_difference, scene_score: @factorial_scene.scene_score, space_ratio: @factorial_scene.space_ratio, user_panel_id: @factorial_scene.user_panel_id, vertices_number: @factorial_scene.vertices_number }
    assert_redirected_to factorial_scene_path(assigns(:factorial_scene))
  end

  test "should destroy factorial_scene" do
    assert_difference('FactorialScene.count', -1) do
      delete :destroy, id: @factorial_scene
    end

    assert_redirected_to factorial_scenes_path
  end
end
