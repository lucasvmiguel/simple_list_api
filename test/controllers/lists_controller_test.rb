require 'test_helper'

class ListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @list = lists(:one)
  end

  test "should get index" do
    signed_in_headers = api_sign_in
    
    get lists_url, headers: signed_in_headers

    assert_response :success
  end

  test "should create list" do
    signed_in_headers = api_sign_in

    assert_difference('List.count') do
      post lists_url, params: { list: { name: @list.name } }, headers: signed_in_headers
    end

    assert_response :created
  end

  test "should destroy list" do
    signed_in_headers = api_sign_in

    assert_difference('List.count', -1) do
      delete list_url(@list), headers: signed_in_headers
    end

    assert_response :no_content
  end
end
