require 'test_helper'

class UserCategoryMatchesControllerTest < ActionController::TestCase
  setup do
    @user_category_match = user_category_matches(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_category_matches)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_category_match" do
    assert_difference('UserCategoryMatch.count') do
      post :create, user_category_match: { match_id: @user_category_match.match_id, match_id: @user_category_match.match_id, uc_id: @user_category_match.uc_id, user_category_id: @user_category_match.user_category_id }
    end

    assert_redirected_to user_category_match_path(assigns(:user_category_match))
  end

  test "should show user_category_match" do
    get :show, id: @user_category_match
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_category_match
    assert_response :success
  end

  test "should update user_category_match" do
    patch :update, id: @user_category_match, user_category_match: { match_id: @user_category_match.match_id, match_id: @user_category_match.match_id, uc_id: @user_category_match.uc_id, user_category_id: @user_category_match.user_category_id }
    assert_redirected_to user_category_match_path(assigns(:user_category_match))
  end

  test "should destroy user_category_match" do
    assert_difference('UserCategoryMatch.count', -1) do
      delete :destroy, id: @user_category_match
    end

    assert_redirected_to user_category_matches_path
  end
end
