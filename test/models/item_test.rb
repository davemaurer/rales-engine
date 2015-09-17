require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  test "item is valid" do
    item = Item.first

    assert item.valid?
  end

  test "item is not valid with no name" do
    item = Item.first

    item.name = nil

    refute item.valid?
  end

  test "item is not valid with no description" do
    item = Item.first

    item.description = nil

    refute item.valid?
  end

  test "item is not valid with no merchant_id" do
    item = Item.first

    item.merchant_id = nil

    refute item.valid?
  end
end
