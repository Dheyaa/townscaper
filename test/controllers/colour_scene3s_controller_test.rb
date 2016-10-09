require 'test_helper'

class ColourScene3sControllerTest < ActionController::TestCase
  setup do
    @colour_scene3 = colour_scene3s(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:colour_scene3s)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create colour_scene3" do
    assert_difference('ColourScene3.count') do
      post :create, colour_scene3: { admin_panel_id: @colour_scene3.admin_panel_id, colour_difference: @colour_scene3.colour_difference, file_name: @colour_scene3.file_name, position_difference: @colour_scene3.position_difference, scene_score: @colour_scene3.scene_score, space_ratio: @colour_scene3.space_ratio, user_panel_id: @colour_scene3.user_panel_id, vertices_number: @colour_scene3.vertices_number }
    end

    assert_redirected_to colour_scene3_path(assigns(:colour_scene3))
  end

  test "should show colour_scene3" do
    get :show, id: @colour_scene3
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @colour_scene3
    assert_response :success
  end

  test "should update colour_scene3" do
    patch :update, id: @colour_scene3, colour_scene3: { admin_panel_id: @colour_scene3.admin_panel_id, colour_difference: @colour_scene3.colour_difference, file_name: @colour_scene3.file_name, position_difference: @colour_scene3.position_difference, scene_score: @colour_scene3.scene_score, space_ratio: @colour_scene3.space_ratio, user_panel_id: @colour_scene3.user_panel_id, vertices_number: @colour_scene3.vertices_number }
    assert_redirected_to colour_scene3_path(assigns(:colour_scene3))
  end

  test "should destroy colour_scene3" do
    assert_difference('ColourScene3.count', -1) do
      delete :destroy, id: @colour_scene3
    end

    assert_redirected_to colour_scene3s_path
  end
end
