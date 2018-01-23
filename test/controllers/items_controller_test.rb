require 'test_helper'

class ItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @item = items(:one)
    @list = lists(:one)
  end

  test "should get index" do
    get list_items_url(@list)
    assert_response :success
  end

  test "should create item" do
    assert_difference('Item.count') do
      post list_items_url(@list), params: { item: { title: @item.title, checked: @item.checked } }
    end

    assert_response :created
  end

  test "should update item" do
    patch list_item_url(@list, @item), params: { item: { title: @item.title, checked: @item.checked } }
    assert_response :success
  end

  test "should destroy item" do
    assert_difference('Item.count', -1) do
      delete list_item_url(@list, @item)
    end

    assert_response :no_content
  end
end
