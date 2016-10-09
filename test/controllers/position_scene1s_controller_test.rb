require 'test_helper'

class PositionScene1sControllerTest < ActionController::TestCase
  setup do
    @position_scene1 = position_scene1s(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:position_scene1s)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create position_scene1" do
    assert_difference('PositionScene1.count') do
      post :create, position_scene1: { admin_panel_id: @position_scene1.admin_panel_id, colour_difference: @position_scene1.colour_difference, file_name: @position_scene1.file_name, position_difference: @position_scene1.position_difference, scene_score: @position_scene1.scene_score, space_ratio: @position_scene1.space_ratio, user_panel_id: @position_scene1.user_panel_id, vertices_number: @position_scene1.vertices_number }
    end

    assert_redirected_to position_scene1_path(assigns(:position_scene1))
  end

  test "should show position_scene1" do
    get :show, id: @position_scene1
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @position_scene1
    assert_response :success
  end

  test "should update position_scene1" do
    patch :update, id: @position_scene1, position_scene1: { admin_panel_id: @position_scene1.admin_panel_id, colour_difference: @position_scene1.colour_difference, file_name: @position_scene1.file_name, position_difference: @position_scene1.position_difference, scene_score: @position_scene1.scene_score, space_ratio: @position_scene1.space_ratio, user_panel_id: @position_scene1.user_panel_id, vertices_number: @position_scene1.vertices_number }
    assert_redirected_to position_scene1_path(assigns(:position_scene1))
  end

  test "should destroy position_scene1" do
    assert_difference('PositionScene1.count', -1) do
      delete :destroy, id: @position_scene1
    end

    assert_redirected_to position_scene1s_path
  end
end
