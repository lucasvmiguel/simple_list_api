require 'test_helper'

class ListTest < ActiveSupport::TestCase
  test "list one" do
    list = lists(:one)
    assert list.valid?
  end

  test "list two" do
    list = lists(:two)
    assert list.valid?
  end

  test "list three" do
    list = lists(:three)
    refute list.valid?
  end
end
