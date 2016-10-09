require 'test_helper'

class SpaceScene3sControllerTest < ActionController::TestCase
  setup do
    @space_scene3 = space_scene3s(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:space_scene3s)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create space_scene3" do
    assert_difference('SpaceScene3.count') do
      post :create, space_scene3: { admin_panel_id: @space_scene3.admin_panel_id, colour_difference: @space_scene3.colour_difference, file_name: @space_scene3.file_name, position_difference: @space_scene3.position_difference, scene_score: @space_scene3.scene_score, space_ratio: @space_scene3.space_ratio, user_panel_id: @space_scene3.user_panel_id, vertices_number: @space_scene3.vertices_number }
    end

    assert_redirected_to space_scene3_path(assigns(:space_scene3))
  end

  test "should show space_scene3" do
    get :show, id: @space_scene3
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @space_scene3
    assert_response :success
  end

  test "should update space_scene3" do
    patch :update, id: @space_scene3, space_scene3: { admin_panel_id: @space_scene3.admin_panel_id, colour_difference: @space_scene3.colour_difference, file_name: @space_scene3.file_name, position_difference: @space_scene3.position_difference, scene_score: @space_scene3.scene_score, space_ratio: @space_scene3.space_ratio, user_panel_id: @space_scene3.user_panel_id, vertices_number: @space_scene3.vertices_number }
    assert_redirected_to space_scene3_path(assigns(:space_scene3))
  end

  test "should destroy space_scene3" do
    assert_difference('SpaceScene3.count', -1) do
      delete :destroy, id: @space_scene3
    end

    assert_redirected_to space_scene3s_path
  end
end
