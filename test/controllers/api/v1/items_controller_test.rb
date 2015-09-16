require 'test_helper'

class Api::V1::ItemsControllerTest < ActionController::TestCase
  test '#show' do
    get :show, format: :json, id: Merchant.first.id

    merchant = JSON.parse(response.body, symbolize_names: true)

    assert_response :success

    assert_equal 'merchant_one', merchant[:name]
    assert_equal 1, merchant[:id]
  end

  test '#index' do
    get :index, format: :json

    merchants = JSON.parse(response.body, symbolize_names: true)
    merchant = merchants.first
    merchant2 = merchants.second

    assert_response :success

    assert_equal 3, merchants.count
    assert_equal 'merchant_one', merchant[:name]
    assert_equal 'merchant_two', merchant2[:name]
  end

  test '#random' do
    merchants1 = []
    100.times do
      get :random, format: :json
      merchants1 << JSON.parse(response.body, symbolize_name: true)
    end

    merchants2 = []
    100.times do
      get :random, format: :json
      merchants2 << JSON.parse(response.body, symbolize_name: true)
    end

    refute_equal merchants1, merchants2
  end

  test '#find' do
    get :find, format: :json, id: Merchant.first.id

    merchant = JSON.parse(response.body, symbolize_names: true)

    assert_response :success

    assert_equal 'merchant_one', merchant[:name]
    assert_equal 1, merchant[:id]
  end

  test '#find_all' do
    get :find_all, format: :json, name: 'merchant_one'

    merchants = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal 2, merchants.count
  end

  test '#invoices' do
    get :invoices, format: :json, id: Merchant.first.id

    invoice_response = JSON.parse(response.body, symbolize_names: true)
    invoice = invoice_response.first

    assert_response :success
    assert_equal 'shipped_one', invoice[:status]
    assert_equal 1, invoice[:merchant_id]
  end

  test '#items' do
    get :items, format: :json, id: Merchant.first.id

    items = JSON.parse(response.body, symbolize_names: true)
    item = items.first

    assert_response :success
    assert_equal 'item_one', item[:name]
    assert_equal '1.99', item[:unit_price]
    assert_equal 1, item[:merchant_id]
  end
end
