require 'test_helper'

class PositionScene3sControllerTest < ActionController::TestCase
  setup do
    @position_scene3 = position_scene3s(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:position_scene3s)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create position_scene3" do
    assert_difference('PositionScene3.count') do
      post :create, position_scene3: { admin_panel_id: @position_scene3.admin_panel_id, colour_difference: @position_scene3.colour_difference, file_name: @position_scene3.file_name, position_difference: @position_scene3.position_difference, scene_score: @position_scene3.scene_score, space_ratio: @position_scene3.space_ratio, user_panel_id: @position_scene3.user_panel_id, vertices_number: @position_scene3.vertices_number }
    end

    assert_redirected_to position_scene3_path(assigns(:position_scene3))
  end

  test "should show position_scene3" do
    get :show, id: @position_scene3
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @position_scene3
    assert_response :success
  end

  test "should update position_scene3" do
    patch :update, id: @position_scene3, position_scene3: { admin_panel_id: @position_scene3.admin_panel_id, colour_difference: @position_scene3.colour_difference, file_name: @position_scene3.file_name, position_difference: @position_scene3.position_difference, scene_score: @position_scene3.scene_score, space_ratio: @position_scene3.space_ratio, user_panel_id: @position_scene3.user_panel_id, vertices_number: @position_scene3.vertices_number }
    assert_redirected_to position_scene3_path(assigns(:position_scene3))
  end

  test "should destroy position_scene3" do
    assert_difference('PositionScene3.count', -1) do
      delete :destroy, id: @position_scene3
    end

    assert_redirected_to position_scene3s_path
  end
end
