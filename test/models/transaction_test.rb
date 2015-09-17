require 'test_helper'

class TransactionTest < ActiveSupport::TestCase
  test "transaction is valid" do
    transaction = Transaction.first

    assert transaction.valid?
  end

  test "transaction is not valid with no result" do
    transaction = Transaction.first

    transaction.result = nil

    refute transaction.valid?
  end

  test "transaction is not valid with no invoice_id" do
    transaction = Transaction.first

    transaction.invoice_id = nil

    refute transaction.valid?
  end

  test "transaction is not valid with no credit_card_number" do
    transaction = Transaction.first

    transaction.credit_card_number = nil

    refute transaction.valid?
  end
end
