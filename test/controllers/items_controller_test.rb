require 'test_helper'

class ItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @item = items(:one)
  end

  test "should get index" do
    get items_url
    assert_response :success
  end

  test "should create item" do
    assert_difference('Item.count') do
      post items_url, params: { item: { title: @item.title, checked: @item.checked } }
    end

    assert_response :created
  end

  test "should update item" do
    patch item_url(@item), params: { item: { title: @item.title, checked: @item.checked } }
    assert_response :success
  end

  test "should destroy item" do
    assert_difference('Item.count', -1) do
      delete item_url(@item)
    end

    assert_response :no_content
  end
end
