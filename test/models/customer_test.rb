require 'test_helper'

class CustomerTest < ActiveSupport::TestCase
  test "customer is valid" do
    customer = Customer.first

    assert customer.valid?
  end

  test "customer is not valid with no first name" do
    customer = Customer.first

    customer.first_name = nil

    refute customer.valid?
  end
end
