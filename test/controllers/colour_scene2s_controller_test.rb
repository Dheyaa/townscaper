require 'test_helper'

class ColourScene2sControllerTest < ActionController::TestCase
  setup do
    @colour_scene2 = colour_scene2s(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:colour_scene2s)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create colour_scene2" do
    assert_difference('ColourScene2.count') do
      post :create, colour_scene2: { admin_panel_id: @colour_scene2.admin_panel_id, colour_difference: @colour_scene2.colour_difference, file_name: @colour_scene2.file_name, position_difference: @colour_scene2.position_difference, scene_score: @colour_scene2.scene_score, space_ratio: @colour_scene2.space_ratio, user_panel_id: @colour_scene2.user_panel_id, vertices_number: @colour_scene2.vertices_number }
    end

    assert_redirected_to colour_scene2_path(assigns(:colour_scene2))
  end

  test "should show colour_scene2" do
    get :show, id: @colour_scene2
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @colour_scene2
    assert_response :success
  end

  test "should update colour_scene2" do
    patch :update, id: @colour_scene2, colour_scene2: { admin_panel_id: @colour_scene2.admin_panel_id, colour_difference: @colour_scene2.colour_difference, file_name: @colour_scene2.file_name, position_difference: @colour_scene2.position_difference, scene_score: @colour_scene2.scene_score, space_ratio: @colour_scene2.space_ratio, user_panel_id: @colour_scene2.user_panel_id, vertices_number: @colour_scene2.vertices_number }
    assert_redirected_to colour_scene2_path(assigns(:colour_scene2))
  end

  test "should destroy colour_scene2" do
    assert_difference('ColourScene2.count', -1) do
      delete :destroy, id: @colour_scene2
    end

    assert_redirected_to colour_scene2s_path
  end
end
