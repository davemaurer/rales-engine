require 'test_helper'

class InvoiceItemTest < ActiveSupport::TestCase
  test "invoice_item is valid" do
    invoice_item = InvoiceItem.first

    assert invoice_item.valid?
  end

  test "invoice_item is not valid with no unit_price" do
    invoice_item = InvoiceItem.first

    invoice_item.unit_price = nil

    refute invoice_item.valid?
  end

  test "invoice_item is not valid with no invoice_id" do
    invoice_item = InvoiceItem.first

    invoice_item.invoice_id = nil

    refute invoice_item.valid?
  end

  test "invoice_item is not valid with no quantity" do
    invoice_item = InvoiceItem.first

    invoice_item.quantity = nil

    refute invoice_item.valid?
  end
end
