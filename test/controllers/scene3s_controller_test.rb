require 'test_helper'

class Scene3sControllerTest < ActionController::TestCase
  setup do
    @scene3 = scene3s(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:scene3s)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create scene3" do
    assert_difference('Scene3.count') do
      post :create, scene3: { admin_panel_id: @scene3.admin_panel_id, colour_difference: @scene3.colour_difference, file_name: @scene3.file_name, position_difference: @scene3.position_difference, scene_score: @scene3.scene_score, space_ratio: @scene3.space_ratio, user_panel_id: @scene3.user_panel_id, vertices_number: @scene3.vertices_number }
    end

    assert_redirected_to scene3_path(assigns(:scene3))
  end

  test "should show scene3" do
    get :show, id: @scene3
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @scene3
    assert_response :success
  end

  test "should update scene3" do
    patch :update, id: @scene3, scene3: { admin_panel_id: @scene3.admin_panel_id, colour_difference: @scene3.colour_difference, file_name: @scene3.file_name, position_difference: @scene3.position_difference, scene_score: @scene3.scene_score, space_ratio: @scene3.space_ratio, user_panel_id: @scene3.user_panel_id, vertices_number: @scene3.vertices_number }
    assert_redirected_to scene3_path(assigns(:scene3))
  end

  test "should destroy scene3" do
    assert_difference('Scene3.count', -1) do
      delete :destroy, id: @scene3
    end

    assert_redirected_to scene3s_path
  end
end
