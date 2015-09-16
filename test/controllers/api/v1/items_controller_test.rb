require 'test_helper'

class Api::V1::ItemsControllerTest < ActionController::TestCase
  test '#show' do
    get :show, format: :json, id: Item.first.id

    item = JSON.parse(response.body, symbolize_names: true)

    assert_response :success

    assert_equal 'item_one', item[:name]
    assert_equal 1, item[:id]
  end

  test '#index' do
    get :index, format: :json

    items = JSON.parse(response.body, symbolize_names: true)
    item = items.first
    item2 = items.second

    assert_response :success

    assert_equal 3, items.count
    assert_equal 'item_one', item[:name]
    assert_equal 'item_two', item2[:name]
  end

  test '#random' do
    items1 = []
    100.times do
      get :random, format: :json
      items1 << JSON.parse(response.body, symbolize_name: true)
    end

    items2 = []
    100.times do
      get :random, format: :json
      items2 << JSON.parse(response.body, symbolize_name: true)
    end

    refute_equal items1, items2
  end

  test '#find' do
    get :find, format: :json, id: Item.first.id

    item = JSON.parse(response.body, symbolize_names: true)

    assert_response :success

    assert_equal 'item_one', item[:name]
    assert_equal 1, item[:id]
  end

  test '#find_all' do
    get :find_all, format: :json, name: 'item_one'

    merchants = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal 2, merchants.count
  end

  test '#invoice_items' do
    get :invoice_items, format: :json, id: Item.first.id

    invoice_items_response = JSON.parse(response.body, symbolize_names: true)
    invoice_item = invoice_items_response.first

    assert_response :success
    assert_equal 1000, invoice_item[:quantity]
    assert_equal 1, invoice_item[:item_id]
  end

  test '#merchant' do
    get :merchant, format: :json, id: Item.first.id

    merchant = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal 'merchant_one', merchant[:name]
    assert_equal 1, merchant[:id]
  end
end
