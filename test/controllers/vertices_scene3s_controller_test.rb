require 'test_helper'

class VerticesScene3sControllerTest < ActionController::TestCase
  setup do
    @vertices_scene3 = vertices_scene3s(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vertices_scene3s)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vertices_scene3" do
    assert_difference('VerticesScene3.count') do
      post :create, vertices_scene3: { admin_panel_id: @vertices_scene3.admin_panel_id, colour_difference: @vertices_scene3.colour_difference, file_name: @vertices_scene3.file_name, position_difference: @vertices_scene3.position_difference, scene_score: @vertices_scene3.scene_score, space_ratio: @vertices_scene3.space_ratio, user_panel_id: @vertices_scene3.user_panel_id, vertices_number: @vertices_scene3.vertices_number }
    end

    assert_redirected_to vertices_scene3_path(assigns(:vertices_scene3))
  end

  test "should show vertices_scene3" do
    get :show, id: @vertices_scene3
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vertices_scene3
    assert_response :success
  end

  test "should update vertices_scene3" do
    patch :update, id: @vertices_scene3, vertices_scene3: { admin_panel_id: @vertices_scene3.admin_panel_id, colour_difference: @vertices_scene3.colour_difference, file_name: @vertices_scene3.file_name, position_difference: @vertices_scene3.position_difference, scene_score: @vertices_scene3.scene_score, space_ratio: @vertices_scene3.space_ratio, user_panel_id: @vertices_scene3.user_panel_id, vertices_number: @vertices_scene3.vertices_number }
    assert_redirected_to vertices_scene3_path(assigns(:vertices_scene3))
  end

  test "should destroy vertices_scene3" do
    assert_difference('VerticesScene3.count', -1) do
      delete :destroy, id: @vertices_scene3
    end

    assert_redirected_to vertices_scene3s_path
  end
end
