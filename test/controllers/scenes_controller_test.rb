require 'test_helper'

class ScenesControllerTest < ActionController::TestCase
  setup do
    @scene = scenes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:scenes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create scene" do
    assert_difference('Scene.count') do
      post :create, scene: { admin_panel_id: @scene.admin_panel_id, colour_difference: @scene.colour_difference, file_name: @scene.file_name, position_difference: @scene.position_difference, scene_score: @scene.scene_score, space_ratio: @scene.space_ratio, user_panel_id: @scene.user_panel_id, vertices_number: @scene.vertices_number }
    end

    assert_redirected_to scene_path(assigns(:scene))
  end

  test "should show scene" do
    get :show, id: @scene
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @scene
    assert_response :success
  end

  test "should update scene" do
    patch :update, id: @scene, scene: { admin_panel_id: @scene.admin_panel_id, colour_difference: @scene.colour_difference, file_name: @scene.file_name, position_difference: @scene.position_difference, scene_score: @scene.scene_score, space_ratio: @scene.space_ratio, user_panel_id: @scene.user_panel_id, vertices_number: @scene.vertices_number }
    assert_redirected_to scene_path(assigns(:scene))
  end

  test "should destroy scene" do
    assert_difference('Scene.count', -1) do
      delete :destroy, id: @scene
    end

    assert_redirected_to scenes_path
  end
end
