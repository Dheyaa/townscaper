require 'test_helper'

class Scene2sControllerTest < ActionController::TestCase
  setup do
    @scene2 = scene2s(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:scene2s)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create scene2" do
    assert_difference('Scene2.count') do
      post :create, scene2: { admin_panel_id: @scene2.admin_panel_id, colour_difference: @scene2.colour_difference, file_name: @scene2.file_name, position_difference: @scene2.position_difference, scene_score: @scene2.scene_score, space_ratio: @scene2.space_ratio, user_panel_id: @scene2.user_panel_id, vertices_number: @scene2.vertices_number }
    end

    assert_redirected_to scene2_path(assigns(:scene2))
  end

  test "should show scene2" do
    get :show, id: @scene2
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @scene2
    assert_response :success
  end

  test "should update scene2" do
    patch :update, id: @scene2, scene2: { admin_panel_id: @scene2.admin_panel_id, colour_difference: @scene2.colour_difference, file_name: @scene2.file_name, position_difference: @scene2.position_difference, scene_score: @scene2.scene_score, space_ratio: @scene2.space_ratio, user_panel_id: @scene2.user_panel_id, vertices_number: @scene2.vertices_number }
    assert_redirected_to scene2_path(assigns(:scene2))
  end

  test "should destroy scene2" do
    assert_difference('Scene2.count', -1) do
      delete :destroy, id: @scene2
    end

    assert_redirected_to scene2s_path
  end
end
