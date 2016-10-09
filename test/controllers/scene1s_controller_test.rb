require 'test_helper'

class Scene1sControllerTest < ActionController::TestCase
  setup do
    @scene1 = scene1s(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:scene1s)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create scene1" do
    assert_difference('Scene1.count') do
      post :create, scene1: { admin_panel_id: @scene1.admin_panel_id, colour_difference: @scene1.colour_difference, file_name: @scene1.file_name, position_difference: @scene1.position_difference, scene_score: @scene1.scene_score, space_ratio: @scene1.space_ratio, user_panel_id: @scene1.user_panel_id, vertices_number: @scene1.vertices_number }
    end

    assert_redirected_to scene1_path(assigns(:scene1))
  end

  test "should show scene1" do
    get :show, id: @scene1
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @scene1
    assert_response :success
  end

  test "should update scene1" do
    patch :update, id: @scene1, scene1: { admin_panel_id: @scene1.admin_panel_id, colour_difference: @scene1.colour_difference, file_name: @scene1.file_name, position_difference: @scene1.position_difference, scene_score: @scene1.scene_score, space_ratio: @scene1.space_ratio, user_panel_id: @scene1.user_panel_id, vertices_number: @scene1.vertices_number }
    assert_redirected_to scene1_path(assigns(:scene1))
  end

  test "should destroy scene1" do
    assert_difference('Scene1.count', -1) do
      delete :destroy, id: @scene1
    end

    assert_redirected_to scene1s_path
  end
end
