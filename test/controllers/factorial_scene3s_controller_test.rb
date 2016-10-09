require 'test_helper'

class FactorialScene3sControllerTest < ActionController::TestCase
  setup do
    @factorial_scene3 = factorial_scene3s(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:factorial_scene3s)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create factorial_scene3" do
    assert_difference('FactorialScene3.count') do
      post :create, factorial_scene3: { admin_panel_id: @factorial_scene3.admin_panel_id, colour_difference: @factorial_scene3.colour_difference, file_name: @factorial_scene3.file_name, position_difference: @factorial_scene3.position_difference, scene_score: @factorial_scene3.scene_score, space_ratio: @factorial_scene3.space_ratio, user_panel_id: @factorial_scene3.user_panel_id, vertices_number: @factorial_scene3.vertices_number }
    end

    assert_redirected_to factorial_scene3_path(assigns(:factorial_scene3))
  end

  test "should show factorial_scene3" do
    get :show, id: @factorial_scene3
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @factorial_scene3
    assert_response :success
  end

  test "should update factorial_scene3" do
    patch :update, id: @factorial_scene3, factorial_scene3: { admin_panel_id: @factorial_scene3.admin_panel_id, colour_difference: @factorial_scene3.colour_difference, file_name: @factorial_scene3.file_name, position_difference: @factorial_scene3.position_difference, scene_score: @factorial_scene3.scene_score, space_ratio: @factorial_scene3.space_ratio, user_panel_id: @factorial_scene3.user_panel_id, vertices_number: @factorial_scene3.vertices_number }
    assert_redirected_to factorial_scene3_path(assigns(:factorial_scene3))
  end

  test "should destroy factorial_scene3" do
    assert_difference('FactorialScene3.count', -1) do
      delete :destroy, id: @factorial_scene3
    end

    assert_redirected_to factorial_scene3s_path
  end
end
