require 'test_helper'

class InvoiceTest < ActiveSupport::TestCase
  test "invoice is valid" do
    invoice = Invoice.first

    assert invoice.valid?
  end

  test "invoice is not valid with no status" do
    invoice = Invoice.first

    invoice.status = nil

    refute invoice.valid?
  end

  test "invoice is not valid with no customer_id" do
    invoice = Invoice.first

    invoice.customer_id = nil

    refute invoice.valid?
  end

  test "invoice is not valid with no merchant_id" do
    invoice = Invoice.first

    invoice.merchant_id = nil

    refute invoice.valid?
  end
end
