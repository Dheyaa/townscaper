require 'test_helper'

class UserPanelsControllerTest < ActionController::TestCase
  setup do
    @user_panel = user_panels(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_panels)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_panel" do
    assert_difference('UserPanel.count') do
      post :create, user_panel: { admin_panel_id: @user_panel.admin_panel_id, age_group: @user_panel.age_group, art_related: @user_panel.art_related, consent: @user_panel.consent, education_level: @user_panel.education_level, feedback: @user_panel.feedback, gender: @user_panel.gender, scene_valid: @user_panel.scene_valid, scenes_completed: @user_panel.scenes_completed, tutorial_completed: @user_panel.tutorial_completed, user_id: @user_panel.user_id }
    end

    assert_redirected_to user_panel_path(assigns(:user_panel))
  end

  test "should show user_panel" do
    get :show, id: @user_panel
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_panel
    assert_response :success
  end

  test "should update user_panel" do
    patch :update, id: @user_panel, user_panel: { admin_panel_id: @user_panel.admin_panel_id, age_group: @user_panel.age_group, art_related: @user_panel.art_related, consent: @user_panel.consent, education_level: @user_panel.education_level, feedback: @user_panel.feedback, gender: @user_panel.gender, scene_valid: @user_panel.scene_valid, scenes_completed: @user_panel.scenes_completed, tutorial_completed: @user_panel.tutorial_completed, user_id: @user_panel.user_id }
    assert_redirected_to user_panel_path(assigns(:user_panel))
  end

  test "should destroy user_panel" do
    assert_difference('UserPanel.count', -1) do
      delete :destroy, id: @user_panel
    end

    assert_redirected_to user_panels_path
  end
end
