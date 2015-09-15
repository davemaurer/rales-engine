class Api::V1::CustomersController < ApplicationController
  def show
    respond_with customer
  end

  def find
    value = customer_params.values.first
    term = customer_params.keys.first

    respond_with Customer.find_by(term => value)
  end

  def find_all
    value = customer_params.values.first
    term = customer_params.keys.first

    respond_with Customer.where(term => value)
  end

  def random
    respond_with Customer.all.sample
  end

  def invoices
    respond_with customer.invoices
  end

  def transactions
    respond_with customer.transactions
  end

  private

  def customer_params
    params.require(:customer).permit(:id, :first_name, :last_name, :customer_id)
  end

  def customer
    Customer.find_by(id: params[:id])
  end
end
