require 'test_helper'

class FactorialScene1sControllerTest < ActionController::TestCase
  setup do
    @factorial_scene1 = factorial_scene1s(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:factorial_scene1s)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create factorial_scene1" do
    assert_difference('FactorialScene1.count') do
      post :create, factorial_scene1: { admin_panel_id: @factorial_scene1.admin_panel_id, colour_difference: @factorial_scene1.colour_difference, file_name: @factorial_scene1.file_name, position_difference: @factorial_scene1.position_difference, scene_score: @factorial_scene1.scene_score, space_ratio: @factorial_scene1.space_ratio, user_panel_id: @factorial_scene1.user_panel_id, vertices_number: @factorial_scene1.vertices_number }
    end

    assert_redirected_to factorial_scene1_path(assigns(:factorial_scene1))
  end

  test "should show factorial_scene1" do
    get :show, id: @factorial_scene1
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @factorial_scene1
    assert_response :success
  end

  test "should update factorial_scene1" do
    patch :update, id: @factorial_scene1, factorial_scene1: { admin_panel_id: @factorial_scene1.admin_panel_id, colour_difference: @factorial_scene1.colour_difference, file_name: @factorial_scene1.file_name, position_difference: @factorial_scene1.position_difference, scene_score: @factorial_scene1.scene_score, space_ratio: @factorial_scene1.space_ratio, user_panel_id: @factorial_scene1.user_panel_id, vertices_number: @factorial_scene1.vertices_number }
    assert_redirected_to factorial_scene1_path(assigns(:factorial_scene1))
  end

  test "should destroy factorial_scene1" do
    assert_difference('FactorialScene1.count', -1) do
      delete :destroy, id: @factorial_scene1
    end

    assert_redirected_to factorial_scene1s_path
  end
end
