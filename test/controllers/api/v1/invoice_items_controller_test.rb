require 'test_helper'

class Api::V1::InvoiceItemsControllerTest < ActionController::TestCase
  test '#show' do
    get :show, format: :json, id: InvoiceItem.first.id

    invoice_item = JSON.parse(response.body, symbolize_names: true)

    assert_response :success

    assert_equal 1000, invoice_item[:quantity]
    assert_equal 1, invoice_item[:id]
  end

  test '#index' do
    get :index, format: :json

    invoice_items = JSON.parse(response.body, symbolize_names: true)
    invoice_item = invoice_items.first
    invoice_item2 = invoice_items.second

    assert_response :success

    assert_equal 3, invoice_items.count
    assert_equal '1.99', invoice_item[:unit_price]
    assert_equal '2.99', invoice_item2[:unit_price]
  end

  test '#random' do
    invoice_items1 = []
    100.times do
      get :random, format: :json
      invoice_items1 << JSON.parse(response.body, symbolize_name: true)
    end

    invoice_items2 = []
    100.times do
      get :random, format: :json
      invoice_items2 << JSON.parse(response.body, symbolize_name: true)
    end

    refute_equal invoice_items1, invoice_items2
  end

  test '#find' do
    get :find, format: :json, id: InvoiceItem.first.id

    invoice_item = JSON.parse(response.body, symbolize_names: true)

    assert_response :success

    assert_equal 1000, invoice_item[:quantity]
    assert_equal 1, invoice_item[:id]
  end

  test '#find_all' do
    get :find_all, format: :json, quantity: 1000

    invoice_items = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal 2, invoice_items.count
  end

  test '#invoice' do
    get :invoice, format: :json, id: InvoiceItem.first.id

    invoice = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal 'shipped_one', invoice[:status]
    assert_equal 1, invoice[:id]
  end

  test '#item' do
    get :item, format: :json, id: InvoiceItem.first.id

    item = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal 'item_one', item[:name]
    assert_equal 1, item[:id]
  end
end
