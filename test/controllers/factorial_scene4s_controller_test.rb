require 'test_helper'

class FactorialScene4sControllerTest < ActionController::TestCase
  setup do
    @factorial_scene4 = factorial_scene4s(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:factorial_scene4s)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create factorial_scene4" do
    assert_difference('FactorialScene4.count') do
      post :create, factorial_scene4: { admin_panel_id: @factorial_scene4.admin_panel_id, colour_difference: @factorial_scene4.colour_difference, file_name: @factorial_scene4.file_name, position_difference: @factorial_scene4.position_difference, scene_score: @factorial_scene4.scene_score, space_ratio: @factorial_scene4.space_ratio, user_panel_id: @factorial_scene4.user_panel_id, vertices_number: @factorial_scene4.vertices_number }
    end

    assert_redirected_to factorial_scene4_path(assigns(:factorial_scene4))
  end

  test "should show factorial_scene4" do
    get :show, id: @factorial_scene4
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @factorial_scene4
    assert_response :success
  end

  test "should update factorial_scene4" do
    patch :update, id: @factorial_scene4, factorial_scene4: { admin_panel_id: @factorial_scene4.admin_panel_id, colour_difference: @factorial_scene4.colour_difference, file_name: @factorial_scene4.file_name, position_difference: @factorial_scene4.position_difference, scene_score: @factorial_scene4.scene_score, space_ratio: @factorial_scene4.space_ratio, user_panel_id: @factorial_scene4.user_panel_id, vertices_number: @factorial_scene4.vertices_number }
    assert_redirected_to factorial_scene4_path(assigns(:factorial_scene4))
  end

  test "should destroy factorial_scene4" do
    assert_difference('FactorialScene4.count', -1) do
      delete :destroy, id: @factorial_scene4
    end

    assert_redirected_to factorial_scene4s_path
  end
end
