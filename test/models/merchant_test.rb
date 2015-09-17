require 'test_helper'

class MerchantTest < ActiveSupport::TestCase
  test "merchant is valid" do
    merchant = Merchant.first

    assert merchant.valid?
  end

  test "merchant is not valid with no name" do
    merchant = Merchant.first

    merchant.name = nil

    refute merchant.valid?
  end
end
