require 'test_helper'

class ListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @list = lists(:one)
  end

  test "should get index" do
    get lists_url
    assert_response :success
  end

  test "should create list" do
    assert_difference('List.count') do
      post lists_url, params: { list: { name: @list.name } }
    end

    assert_response :created
  end

  test "should destroy list" do
    assert_difference('List.count', -1) do
      delete list_url(@list)
    end

    assert_response :no_content
  end
end
