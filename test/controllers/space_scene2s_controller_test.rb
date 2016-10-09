require 'test_helper'

class SpaceScene2sControllerTest < ActionController::TestCase
  setup do
    @space_scene2 = space_scene2s(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:space_scene2s)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create space_scene2" do
    assert_difference('SpaceScene2.count') do
      post :create, space_scene2: { admin_panel_id: @space_scene2.admin_panel_id, colour_difference: @space_scene2.colour_difference, file_name: @space_scene2.file_name, position_difference: @space_scene2.position_difference, scene_score: @space_scene2.scene_score, space_ratio: @space_scene2.space_ratio, user_panel_id: @space_scene2.user_panel_id, vertices_number: @space_scene2.vertices_number }
    end

    assert_redirected_to space_scene2_path(assigns(:space_scene2))
  end

  test "should show space_scene2" do
    get :show, id: @space_scene2
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @space_scene2
    assert_response :success
  end

  test "should update space_scene2" do
    patch :update, id: @space_scene2, space_scene2: { admin_panel_id: @space_scene2.admin_panel_id, colour_difference: @space_scene2.colour_difference, file_name: @space_scene2.file_name, position_difference: @space_scene2.position_difference, scene_score: @space_scene2.scene_score, space_ratio: @space_scene2.space_ratio, user_panel_id: @space_scene2.user_panel_id, vertices_number: @space_scene2.vertices_number }
    assert_redirected_to space_scene2_path(assigns(:space_scene2))
  end

  test "should destroy space_scene2" do
    assert_difference('SpaceScene2.count', -1) do
      delete :destroy, id: @space_scene2
    end

    assert_redirected_to space_scene2s_path
  end
end
