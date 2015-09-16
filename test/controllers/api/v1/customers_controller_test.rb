require 'test_helper'

class Api::V1::CustomersControllerTest < ActionController::TestCase
  test '#show' do
    get :show, format: :json, id: Customer.first.id

    customer = JSON.parse(response.body, symbolize_names: true)

    assert_response :success

    assert_equal 'one_first', customer[:first_name]
    assert_equal 'one_last', customer[:last_name]
    assert_equal 1, customer[:id]
  end

  test '#index' do
    get :index, format: :json

    customers = JSON.parse(response.body, symbolize_names: true)
    customer = customers.first

    assert_response :success

    assert_equal 2, customers.count
    assert_equal 'one_first', customer[:first_name]
    assert_equal 'one_last', customer[:last_name]
  end

  test '#random' do
    customers1 = []
    100.times do
      get :random, format: :json
      customers1 << JSON.parse(response.body, symbolize_name: true)
    end

    customers2 = []
    100.times do
      get :random, format: :json
      customers2 << JSON.parse(response.body, symbolize_name: true)
    end

    refute_equal customers1, customers2
  end

  test '#find' do
    get :find, format: :json, id: Customer.first.id

    customer = JSON.parse(response.body, symbolize_names: true)

    assert_response :success

    assert_equal 'one_first', customer[:first_name]
    assert_equal 'one_last', customer[:last_name]
    assert_equal 1, customer[:id]
  end

  test '#find_all' do
    Customer.create(first_name: 'Dave', last_name: 'Doe')
    get :find_all, format: :json, first_name: 'Dave'

    customer = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal 1, customer.count

    Customer.create(first_name: 'Dave', last_name: 'Maurer')
    get :find_all, format: :json, first_name: 'Dave'

    customer = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal 2, customer.count
  end

  test '#invoices' do
    get :invoices, format: :json, id: Customer.first.id

    invoice_response = JSON.parse(response.body, symbolize_names: true)
    invoice = invoice_response.first

    assert_response :success
    assert_equal 'shipped_one', invoice[:status]
    assert_equal 1, invoice[:customer_id]
  end

  test '#transactions' do
    get :transactions, format: :json, id: Customer.first.id

    transactions = JSON.parse(response.body, symbolize_names: true)
    transaction = transactions.first

    assert_response :success
    assert_equal '1234567890123456', transaction[:credit_card_number]
    assert_equal 'success', transaction[:result]
  end
end
