require 'test_helper'

class BingoSessionsControllerTest < ActionController::TestCase
  setup do
    @bingo_session = bingo_sessions(:one)
    @caller = callers(:one)
    sign_in @caller
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bingo_sessions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bingo_session" do
    assert_difference('BingoSession.count') do
      post :create, :bingo_session => @bingo_session.attributes
    end

    assert_redirected_to bingo_session_path(assigns(:bingo_session))
  end

  test "should show bingo_session" do
    get :show, :id => @bingo_session.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @bingo_session.to_param
    assert_response :success
  end

  test "should update bingo_session" do
    put :update, :id => @bingo_session.to_param, :bingo_session => @bingo_session.attributes
    assert_redirected_to bingo_session_path(assigns(:bingo_session))
  end

  test "should destroy bingo_session" do
    assert_difference('BingoSession.count', -1) do
      delete :destroy, :id => @bingo_session.to_param
    end

    assert_redirected_to bingo_sessions_path
  end
end
