require 'test_helper'

class ServeControllerTest < ActionController::TestCase
  test "should get get" do
    get :get
    assert_response :success
  end

  test "should get set" do
    get :set
    assert_response :success
  end

  test "should get add" do
    get :add
    assert_response :success
  end

  test "should get replace" do
    get :replace
    assert_response :success
  end

  test "should get cas" do
    get :cas
    assert_response :success
  end

end
