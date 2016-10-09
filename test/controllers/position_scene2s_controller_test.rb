require 'test_helper'

class PositionScene2sControllerTest < ActionController::TestCase
  setup do
    @position_scene2 = position_scene2s(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:position_scene2s)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create position_scene2" do
    assert_difference('PositionScene2.count') do
      post :create, position_scene2: { admin_panel_id: @position_scene2.admin_panel_id, colour_difference: @position_scene2.colour_difference, file_name: @position_scene2.file_name, position_difference: @position_scene2.position_difference, scene_score: @position_scene2.scene_score, space_ratio: @position_scene2.space_ratio, user_panel_id: @position_scene2.user_panel_id, vertices_number: @position_scene2.vertices_number }
    end

    assert_redirected_to position_scene2_path(assigns(:position_scene2))
  end

  test "should show position_scene2" do
    get :show, id: @position_scene2
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @position_scene2
    assert_response :success
  end

  test "should update position_scene2" do
    patch :update, id: @position_scene2, position_scene2: { admin_panel_id: @position_scene2.admin_panel_id, colour_difference: @position_scene2.colour_difference, file_name: @position_scene2.file_name, position_difference: @position_scene2.position_difference, scene_score: @position_scene2.scene_score, space_ratio: @position_scene2.space_ratio, user_panel_id: @position_scene2.user_panel_id, vertices_number: @position_scene2.vertices_number }
    assert_redirected_to position_scene2_path(assigns(:position_scene2))
  end

  test "should destroy position_scene2" do
    assert_difference('PositionScene2.count', -1) do
      delete :destroy, id: @position_scene2
    end

    assert_redirected_to position_scene2s_path
  end
end
