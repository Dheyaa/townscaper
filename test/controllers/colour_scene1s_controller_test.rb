require 'test_helper'

class ColourScene1sControllerTest < ActionController::TestCase
  setup do
    @colour_scene1 = colour_scene1s(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:colour_scene1s)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create colour_scene1" do
    assert_difference('ColourScene1.count') do
      post :create, colour_scene1: { admin_panel_id: @colour_scene1.admin_panel_id, colour_difference: @colour_scene1.colour_difference, file_name: @colour_scene1.file_name, position_difference: @colour_scene1.position_difference, scene_score: @colour_scene1.scene_score, space_ratio: @colour_scene1.space_ratio, user_panel_id: @colour_scene1.user_panel_id, vertices_number: @colour_scene1.vertices_number }
    end

    assert_redirected_to colour_scene1_path(assigns(:colour_scene1))
  end

  test "should show colour_scene1" do
    get :show, id: @colour_scene1
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @colour_scene1
    assert_response :success
  end

  test "should update colour_scene1" do
    patch :update, id: @colour_scene1, colour_scene1: { admin_panel_id: @colour_scene1.admin_panel_id, colour_difference: @colour_scene1.colour_difference, file_name: @colour_scene1.file_name, position_difference: @colour_scene1.position_difference, scene_score: @colour_scene1.scene_score, space_ratio: @colour_scene1.space_ratio, user_panel_id: @colour_scene1.user_panel_id, vertices_number: @colour_scene1.vertices_number }
    assert_redirected_to colour_scene1_path(assigns(:colour_scene1))
  end

  test "should destroy colour_scene1" do
    assert_difference('ColourScene1.count', -1) do
      delete :destroy, id: @colour_scene1
    end

    assert_redirected_to colour_scene1s_path
  end
end
