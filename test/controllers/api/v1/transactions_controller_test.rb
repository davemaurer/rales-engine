require 'test_helper'

class Api::V1::TransactionsControllerTest < ActionController::TestCase
  test '#show' do
    get :show, format: :json, id: Transaction.first.id

    transaction = JSON.parse(response.body, symbolize_names: true)

    assert_response :success

    assert_equal '1234567890123456', transaction[:credit_card_number]
    assert_equal 1, transaction[:id]
  end

  test '#index' do
    get :index, format: :json

    transactions = JSON.parse(response.body, symbolize_names: true)
    transaction = transactions.first
    transaction2 = transactions.second

    assert_response :success

    assert_equal 2, transactions.count
    assert_equal 'success', transaction[:result]
    assert_equal 'failed', transaction2[:result]
  end

  test '#random' do
    transactions1 = []
    100.times do
      get :random, format: :json
      transactions1 << JSON.parse(response.body, symbolize_name: true)
    end

    transactions2 = []
    100.times do
      get :random, format: :json
      transactions2 << JSON.parse(response.body, symbolize_name: true)
    end

    refute_equal transactions1, transactions2
  end

  test '#find' do
    get :find, format: :json, id: Transaction.first.id

    transaction = JSON.parse(response.body, symbolize_names: true)

    assert_response :success

    assert_equal 'success', transaction[:result]
    assert_equal 1, transaction[:id]
  end

  test '#find_all' do
    get :find_all, format: :json, credit_card_number: '1234567890123456'

    transactions = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal 2, transactions.count
  end

  test '#invoice' do
    get :invoice, format: :json, id: Transaction.first.id

    invoice = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal 'shipped_one', invoice[:status]
    assert_equal 1, invoice[:id]
  end
end
