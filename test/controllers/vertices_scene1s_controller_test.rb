require 'test_helper'

class VerticesScene1sControllerTest < ActionController::TestCase
  setup do
    @vertices_scene1 = vertices_scene1s(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vertices_scene1s)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vertices_scene1" do
    assert_difference('VerticesScene1.count') do
      post :create, vertices_scene1: { admin_panel_id: @vertices_scene1.admin_panel_id, colour_difference: @vertices_scene1.colour_difference, file_name: @vertices_scene1.file_name, position_difference: @vertices_scene1.position_difference, scene_score: @vertices_scene1.scene_score, space_ratio: @vertices_scene1.space_ratio, user_panel_id: @vertices_scene1.user_panel_id, vertices_number: @vertices_scene1.vertices_number }
    end

    assert_redirected_to vertices_scene1_path(assigns(:vertices_scene1))
  end

  test "should show vertices_scene1" do
    get :show, id: @vertices_scene1
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vertices_scene1
    assert_response :success
  end

  test "should update vertices_scene1" do
    patch :update, id: @vertices_scene1, vertices_scene1: { admin_panel_id: @vertices_scene1.admin_panel_id, colour_difference: @vertices_scene1.colour_difference, file_name: @vertices_scene1.file_name, position_difference: @vertices_scene1.position_difference, scene_score: @vertices_scene1.scene_score, space_ratio: @vertices_scene1.space_ratio, user_panel_id: @vertices_scene1.user_panel_id, vertices_number: @vertices_scene1.vertices_number }
    assert_redirected_to vertices_scene1_path(assigns(:vertices_scene1))
  end

  test "should destroy vertices_scene1" do
    assert_difference('VerticesScene1.count', -1) do
      delete :destroy, id: @vertices_scene1
    end

    assert_redirected_to vertices_scene1s_path
  end
end
