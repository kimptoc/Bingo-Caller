require 'test_helper'

class PlayerGamesControllerTest < ActionController::TestCase
  setup do
    @player_game = player_games(:one)
    @caller = callers(:one)
    sign_in @caller
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:player_games)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create player_game" do
    PlayerGame.delete_all
    assert_difference('PlayerGame.count') do
      post :create, :player_game => @player_game.attributes
    end

    assert_redirected_to player_game_path(assigns(:player_game))
  end

  test "should show player_game" do
    get :show, :id => @player_game.to_param
    assert_response 302
  end

  test "should get edit" do
    get :edit, :id => @player_game.to_param
    assert_response :success
  end

  test "should update player_game" do
    put :update, :id => @player_game.to_param, :player_game => @player_game.attributes
    assert_redirected_to player_game_path(assigns(:player_game))
  end

  test "should destroy player_game" do
    assert_difference('PlayerGame.count', -1) do
      delete :destroy, :id => @player_game.to_param
    end

    assert_redirected_to player_games_path
  end
end
