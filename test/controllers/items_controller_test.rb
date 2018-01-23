require 'test_helper'

class ItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @item = items(:one)
    @list = lists(:one)
  end

  test "should get index" do
    signed_in_headers = api_sign_in

    get list_items_url(@list), headers: signed_in_headers
    assert_response :success
  end

  test "should create item" do
    signed_in_headers = api_sign_in

    assert_difference('Item.count') do
      post list_items_url(@list), params: { item: { title: @item.title, checked: @item.checked } }, headers: signed_in_headers
    end

    assert_response :created
  end

  test "should update item" do
    signed_in_headers = api_sign_in

    patch list_item_url(@list, @item), params: { item: { title: @item.title, checked: @item.checked } }, headers: signed_in_headers
    assert_response :success
  end

  test "should destroy item" do
    signed_in_headers = api_sign_in

    assert_difference('Item.count', -1) do
      delete list_item_url(@list, @item), headers: signed_in_headers
    end

    assert_response :no_content
  end
end
