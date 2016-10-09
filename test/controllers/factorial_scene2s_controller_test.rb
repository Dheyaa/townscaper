require 'test_helper'

class FactorialScene2sControllerTest < ActionController::TestCase
  setup do
    @factorial_scene2 = factorial_scene2s(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:factorial_scene2s)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create factorial_scene2" do
    assert_difference('FactorialScene2.count') do
      post :create, factorial_scene2: { admin_panel_id: @factorial_scene2.admin_panel_id, colour_difference: @factorial_scene2.colour_difference, file_name: @factorial_scene2.file_name, position_difference: @factorial_scene2.position_difference, scene_score: @factorial_scene2.scene_score, space_ratio: @factorial_scene2.space_ratio, user_panel_id: @factorial_scene2.user_panel_id, vertices_number: @factorial_scene2.vertices_number }
    end

    assert_redirected_to factorial_scene2_path(assigns(:factorial_scene2))
  end

  test "should show factorial_scene2" do
    get :show, id: @factorial_scene2
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @factorial_scene2
    assert_response :success
  end

  test "should update factorial_scene2" do
    patch :update, id: @factorial_scene2, factorial_scene2: { admin_panel_id: @factorial_scene2.admin_panel_id, colour_difference: @factorial_scene2.colour_difference, file_name: @factorial_scene2.file_name, position_difference: @factorial_scene2.position_difference, scene_score: @factorial_scene2.scene_score, space_ratio: @factorial_scene2.space_ratio, user_panel_id: @factorial_scene2.user_panel_id, vertices_number: @factorial_scene2.vertices_number }
    assert_redirected_to factorial_scene2_path(assigns(:factorial_scene2))
  end

  test "should destroy factorial_scene2" do
    assert_difference('FactorialScene2.count', -1) do
      delete :destroy, id: @factorial_scene2
    end

    assert_redirected_to factorial_scene2s_path
  end
end
