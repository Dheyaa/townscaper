require 'test_helper'

class VerticesScene2sControllerTest < ActionController::TestCase
  setup do
    @vertices_scene2 = vertices_scene2s(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vertices_scene2s)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vertices_scene2" do
    assert_difference('VerticesScene2.count') do
      post :create, vertices_scene2: { admin_panel_id: @vertices_scene2.admin_panel_id, colour_difference: @vertices_scene2.colour_difference, file_name: @vertices_scene2.file_name, position_difference: @vertices_scene2.position_difference, scene_score: @vertices_scene2.scene_score, space_ratio: @vertices_scene2.space_ratio, user_panel_id: @vertices_scene2.user_panel_id, vertices_number: @vertices_scene2.vertices_number }
    end

    assert_redirected_to vertices_scene2_path(assigns(:vertices_scene2))
  end

  test "should show vertices_scene2" do
    get :show, id: @vertices_scene2
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vertices_scene2
    assert_response :success
  end

  test "should update vertices_scene2" do
    patch :update, id: @vertices_scene2, vertices_scene2: { admin_panel_id: @vertices_scene2.admin_panel_id, colour_difference: @vertices_scene2.colour_difference, file_name: @vertices_scene2.file_name, position_difference: @vertices_scene2.position_difference, scene_score: @vertices_scene2.scene_score, space_ratio: @vertices_scene2.space_ratio, user_panel_id: @vertices_scene2.user_panel_id, vertices_number: @vertices_scene2.vertices_number }
    assert_redirected_to vertices_scene2_path(assigns(:vertices_scene2))
  end

  test "should destroy vertices_scene2" do
    assert_difference('VerticesScene2.count', -1) do
      delete :destroy, id: @vertices_scene2
    end

    assert_redirected_to vertices_scene2s_path
  end
end
