require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  test "item one" do
    item = items(:one)
    assert item.valid?
  end

  test "item two" do
    item = items(:two)
    assert item.valid?
  end

  test "item three" do
    item = items(:three)
    refute item.valid?
  end

  test "item four" do
    item = items(:four)
    refute item.valid?
  end
end
