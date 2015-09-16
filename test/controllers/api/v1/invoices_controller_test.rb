require 'test_helper'

class Api::V1::InvoicesControllerTest < ActionController::TestCase
  test '#show' do
    get :show, format: :json, id: Invoice.first.id

    invoice = JSON.parse(response.body, symbolize_names: true)

    assert_response :success

    assert_equal 'shipped_one', invoice[:status]
    assert_equal 1, invoice[:id]
  end

  test '#index' do
    get :index, format: :json

    invoices = JSON.parse(response.body, symbolize_names: true)
    invoice = invoices.first
    invoice2 = invoices.second

    assert_response :success

    assert_equal 3, invoices.count
    assert_equal 'shipped_one', invoice[:status]
    assert_equal 'shipped_two', invoice2[:status]
  end

  test '#random' do
    invoices1 = []
    100.times do
      get :random, format: :json
      invoices1 << JSON.parse(response.body, symbolize_name: true)
    end

    invoices2 = []
    100.times do
      get :random, format: :json
      invoices2 << JSON.parse(response.body, symbolize_name: true)
    end

    refute_equal invoices1, invoices2
  end

  test '#find' do
    get :find, format: :json, id: Invoice.first.id

    invoice = JSON.parse(response.body, symbolize_names: true)

    assert_response :success

    assert_equal 'shipped_one', invoice[:status]
    assert_equal 1, invoice[:id]
  end

  test '#find_all' do
    get :find_all, format: :json, status: 'shipped_one'

    invoices = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal 2, invoices.count
  end

  test '#transactions' do
    get :transactions, format: :json, id: Invoice.first.id

    transactions_response = JSON.parse(response.body, symbolize_names: true)
    transaction = transactions_response.first

    assert_response :success
    assert_equal 'success', transaction[:result]
    assert_equal 1, transaction[:id]
  end

  test '#items' do
    get :items, format: :json, id: Invoice.first.id

    items = JSON.parse(response.body, symbolize_names: true)
    item = items.first

    assert_response :success
    assert_equal 'item_one', item[:name]
    assert_equal '1.99', item[:unit_price]
    assert_equal 1, item[:merchant_id]
  end

  test '#merchant' do
    get :merchant, format: :json, id: Invoice.first.id

    merchant = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal 'merchant_one', merchant[:name]
    assert_equal 1, merchant[:id]
  end

  test '#customer' do
    get :customer, format: :json, id: Invoice.first.id

    customer = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal 'one_first', customer[:first_name]
    assert_equal 1, customer[:id]
  end

  test '#invoice_items' do
    get :invoice_items, format: :json, id: InvoiceItem.first.id

    invoice_items = JSON.parse(response.body, symbolize_names: true)
    invoice_item = invoice_items.first

    assert_response :success
    assert_equal 1000, invoice_item[:quantity]
    assert_equal '1.99', invoice_item[:unit_price]
    assert_equal 1, invoice_item[:id]
  end
end
