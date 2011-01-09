require 'test_helper'

class CalledNumbersControllerTest < ActionController::TestCase
  setup do
    @called_number = called_numbers(:one)
    @caller = callers(:one)
    sign_in @caller
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:called_numbers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create called_number" do
    assert_difference('CalledNumber.count') do
      post :create, :called_number => @called_number.attributes
    end

    assert_redirected_to called_number_path(assigns(:called_number))
  end

  test "should show called_number" do
    get :show, :id => @called_number.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @called_number.to_param
    assert_response :success
  end

  test "should update called_number" do
    put :update, :id => @called_number.to_param, :called_number => @called_number.attributes
    assert_redirected_to called_number_path(assigns(:called_number))
  end

  test "should destroy called_number" do
    assert_difference('CalledNumber.count', -1) do
      delete :destroy, :id => @called_number.to_param
    end

    assert_redirected_to called_numbers_path
  end
end
