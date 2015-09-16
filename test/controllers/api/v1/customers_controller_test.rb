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

  test '#'
end
