require 'test_helper'

class SpaceScene1sControllerTest < ActionController::TestCase
  setup do
    @space_scene1 = space_scene1s(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:space_scene1s)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create space_scene1" do
    assert_difference('SpaceScene1.count') do
      post :create, space_scene1: { admin_panel_id: @space_scene1.admin_panel_id, colour_difference: @space_scene1.colour_difference, file_name: @space_scene1.file_name, position_difference: @space_scene1.position_difference, scene_score: @space_scene1.scene_score, space_ratio: @space_scene1.space_ratio, user_panel_id: @space_scene1.user_panel_id, vertices_number: @space_scene1.vertices_number }
    end

    assert_redirected_to space_scene1_path(assigns(:space_scene1))
  end

  test "should show space_scene1" do
    get :show, id: @space_scene1
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @space_scene1
    assert_response :success
  end

  test "should update space_scene1" do
    patch :update, id: @space_scene1, space_scene1: { admin_panel_id: @space_scene1.admin_panel_id, colour_difference: @space_scene1.colour_difference, file_name: @space_scene1.file_name, position_difference: @space_scene1.position_difference, scene_score: @space_scene1.scene_score, space_ratio: @space_scene1.space_ratio, user_panel_id: @space_scene1.user_panel_id, vertices_number: @space_scene1.vertices_number }
    assert_redirected_to space_scene1_path(assigns(:space_scene1))
  end

  test "should destroy space_scene1" do
    assert_difference('SpaceScene1.count', -1) do
      delete :destroy, id: @space_scene1
    end

    assert_redirected_to space_scene1s_path
  end
end
