require 'test_helper'

class FactorialScene5sControllerTest < ActionController::TestCase
  setup do
    @factorial_scene5 = factorial_scene5s(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:factorial_scene5s)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create factorial_scene5" do
    assert_difference('FactorialScene5.count') do
      post :create, factorial_scene5: { admin_panel_id: @factorial_scene5.admin_panel_id, colour_difference: @factorial_scene5.colour_difference, file_name: @factorial_scene5.file_name, position_difference: @factorial_scene5.position_difference, scene_score: @factorial_scene5.scene_score, space_ratio: @factorial_scene5.space_ratio, user_panel_id: @factorial_scene5.user_panel_id, vertices_number: @factorial_scene5.vertices_number }
    end

    assert_redirected_to factorial_scene5_path(assigns(:factorial_scene5))
  end

  test "should show factorial_scene5" do
    get :show, id: @factorial_scene5
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @factorial_scene5
    assert_response :success
  end

  test "should update factorial_scene5" do
    patch :update, id: @factorial_scene5, factorial_scene5: { admin_panel_id: @factorial_scene5.admin_panel_id, colour_difference: @factorial_scene5.colour_difference, file_name: @factorial_scene5.file_name, position_difference: @factorial_scene5.position_difference, scene_score: @factorial_scene5.scene_score, space_ratio: @factorial_scene5.space_ratio, user_panel_id: @factorial_scene5.user_panel_id, vertices_number: @factorial_scene5.vertices_number }
    assert_redirected_to factorial_scene5_path(assigns(:factorial_scene5))
  end

  test "should destroy factorial_scene5" do
    assert_difference('FactorialScene5.count', -1) do
      delete :destroy, id: @factorial_scene5
    end

    assert_redirected_to factorial_scene5s_path
  end
end
