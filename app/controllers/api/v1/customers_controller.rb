class Api::V1::CustomersController < ApplicationController
  def index
    respond_with Customer.all
  end

  def show
    respond_with customer
  end

  def random
    respond_with Customer.all.sample
  end

  def find
    respond_with Customer.find_by(find_params)
  end

  def find_all
    respond_with Customer.where(find_params)
  end

  def invoices
    respond_with customer.invoices
  end

  def transactions
    respond_with customer.transactions
  end

  private

  def customer
    Customer.find_by(id: params[:id])
  end

  def find_params
    params.permit(:id, :first_name, :last_name, :created_at, :updated_at)
  end
end

# cap_params['first_name'] &&= cap_params['first_name'].capitalize
# cap_params['last_name'] &&= cap_params['last_name'].capitalize
# cap_params
